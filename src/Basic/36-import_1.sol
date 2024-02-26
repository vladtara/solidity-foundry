// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

struct Point {
    uint x;
    uint y;
}

error Unauthorized(address caller);

function add(uint _x, uint _y) pure returns(uint) {
    return _x + _y;
}

contract Foo {
    string public name = "Foo";
}