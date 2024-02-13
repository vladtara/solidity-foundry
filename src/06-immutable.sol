// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Immutable variables are like constants. Values of immutable variables can be set inside the constructor but cannot be modified afterwards.

contract Immutable {
    address public immutable ADDR;
    uint public immutable UINT;

    // coding convention to uppercase constant variables
    constructor(uint _UINT) {
        ADDR = msg.sender;
        UINT = _UINT;
    }

}