// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    // State variable to store a number
    uint256 public number;

    // You need to send a transaction to write to a state variable.
    function setNumber(uint256 _number) public {
        number = _number;
    }

    // You can read from a state variable without sending a transaction.
    function getNumber() public view returns (uint256) {
        return number;
    }
}
