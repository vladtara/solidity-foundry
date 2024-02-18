// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
fallback is a special function that is executed either when
    - a function that does not exist is called or
    - Ether is sent directly to a contract but receive() does not exist or msg.data is not empty
fallback has a 2300 gas limit when called by transfer or send.
*/

contract Fallback {
    event Log(string func, uint gas);

    // Fallback function must be declared as external.
    fallback() external payable {
        // send / transfer (forwards 2300 gas to this fallback function)
        // call (forwards all of the gas)
        emit Log("fallback", gasleft());
    }

    // Receive is a variant of fallback that is triggered when msg.data is empty
    receive() external payable {
        emit Log("receive",gasleft());
    }
    
    // Helper function to check the balance of this contract
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

}


contract SendToFallback {
    function transferF(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callF(address payable _to) public payable {
        (bool ok,) = _to.call{value: msg.value}("");
        require(ok,"Failed to send Ether");
    }
}




//fallback can optionally take bytes for input and output
// TestFallbackInputOutput -> FallbackInputOutput -> Counter
contract TestFallbackInputOutput {
    event Log(bytes res);

    function test(address _fallback, bytes calldata data) external {
        (bool ok, bytes memory res) = _fallback.call(data);
        require(ok, "call failed");
        emit Log(res);   
    }

    function getTestData() external pure returns(bytes memory, bytes memory) {
        return (abi.encodeCall(Counter.get, ()), abi.encodeCall(Counter.inc, ()));
    }
}

contract FallbackInpitOutput {
    address immutable target;

    constructor(address _target) {
        target = _target;
    }

    //receive() external payable {}

    fallback(bytes calldata data) external payable returns(bytes memory) {
        (bool ok, bytes memory res) = target.call{value: msg.value}(data);
        require(ok,"Call failed");
        return res;
    } 
}

contract Counter {
    uint public count;

    function get() external view returns(uint) {
        return count;
    }

    function inc() external returns(uint) {
        count += 1;
        return count;
    }
}
