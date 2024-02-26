// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Solidity supports multiple inheritance. Contracts can inherit other contract by using the is keyword.
// Function that is going to be overridden by a child contract must be declared as virtual.
// Function that is going to override a parent function must use the keyword override.
// Order of inheritance is important.
// You have to list the parent contracts in the order from “most base-like” to “most derived”.

/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    function func() public pure virtual returns (string memory) {
        return "A from contract A";
    }
}

// Contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    // Override A.foo()
    function func() public pure virtual override returns (string memory) {
        return "B from Contract B";
    }
}

contract C is A {
    // Override A.foo()
    function func() public pure virtual override returns (string memory) {
        return "C from contract C";
    }
}

// Contracts can inherit from multiple parent contracts.
// When a function is called that is defined multiple times in
// different contracts, parent contracts are searched from
// right to left, and in depth-first manner.

contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function func() public pure override(B, C) returns (string memory) {
        return super.func();
    }
}

contract E is C, B {
    // E.foo() returns "B"
    // since B is the right most parent contract with function foo()
    function func() public pure override(C, B) returns (string memory) {
        return super.func();
    }
}

// Inheritance must be ordered from “most base-like” to “most derived”.
// Swapping the order of A and B will throw a compilation error.
// contract F is B, A {} - Error!
contract F is A, B, C {
    // F.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function func() public pure override(A, B, C) returns (string memory) {
        return super.func();
    }
}
