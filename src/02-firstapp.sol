// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


contract FirstApp {
    uint public count;


    constructor(uint start) {
        count = start;
    }

    function get() external view returns ( uint ) {
        return count;
    }

    function inc() external {
        count += 1;
    }


    function dec() external {
        count -= 1;
    }

}