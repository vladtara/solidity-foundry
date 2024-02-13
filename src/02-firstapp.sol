// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FirstApp {
    uint256 public count;

    constructor(uint256 start) {
        count = start;
    }

    function get() external view returns (uint256) {
        return count;
    }

    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }
}
