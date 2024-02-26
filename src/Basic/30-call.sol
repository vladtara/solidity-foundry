// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
call is a low level function to interact with other contracts.
This is the recommended method to use when you're just sending Ether via calling the fallback function.
However it is not the recommend way to call existing functions.
Few reasons why low-level call is not recommended
 - Reverts are not bubbled up
 - Type checks are bypassed
 - Function existence checks are omitted
*/

contract Receiver {
    event Received(address caller, uint amount, string message);

    receive() external payable {}
    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function test(string calldata _msg, uint _x) public payable returns(uint) {
        emit Received(msg.sender, msg.value, _msg);
        return _x + 1;
    }
}

contract Caller {
    event Response(bool ok, bytes data);

    function testCallFuncTest(address payable _addr) public payable {
        (bool ok, bytes memory data) = _addr.call{value: msg.value, gas: 3000}(
            abi.encodeWithSignature("test(string,uint256)","Call func test", 23)
        );

        emit Response(ok, data);
        
    }

    function testCallFuncDoesNotExist(address payable _addr) external payable {
        (bool ok, bytes memory data) = _addr.call{value: msg.value, gas: 4000}(
            abi.encodeWithSignature("doesNotExist()")
        );
        
        emit Response(ok, data);
    }
}
