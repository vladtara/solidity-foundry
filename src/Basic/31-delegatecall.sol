// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/*
delegatecall is a low level function similar to call.
When contract A executes delegatecall to contract B, B's code is executed
with contract A's storage, msg.sender and msg.value.
*/



contract B {
    // NOTE: storage layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }

}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contractB, uint _num) public payable {
        // A's storage is set, B is not modified.
        (bool ok, bytes memory data) = _contractB.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        require(ok,"Failed dalegatecall");
        data;
    }
}
