// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// A constructor is an optional function that is executed upon contract creation.
// Here are examples of how to pass arguments to constructors.

// base Contract X
contract X {
    string public nameX;

    constructor(string memory _name) {
        nameX = _name;
    }
}

// Base contract Y
contract Y {
    string public nameY;

    constructor(string memory _name) {
        nameY = _name;
    }
}

// There are 2 ways to initialize parent contract with parameters.

// 1) Pass the parameters here in the inheritance list.
contract B is X("name X"), Y("name Y") {}

// 2) Pass the parameters here in the constructor,similar to function modifiers.
contract C is X, Y {
    constructor(string memory _nameX, string memory _nameY) X(nameX) Y(nameY) {}
}

// Parent constructors are always called in the order of inheritance
// regardless of the order of parent contracts listed in the
// constructor of the child contract.

// Order of constructors called:
// 1. X
// 2. Y
// 3. D
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}

// Order of constructors called:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}
