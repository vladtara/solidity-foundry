// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Parent contracts can be called directly, or by using the keyword super.
// By using the keyword super, all of the immediate parent contracts will be called.

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/

contract A {
    // This is called an event. You can emit events from your function
    // and they are logged into the transaction log.
    // In our case, this will be useful for tracing function calls.
    event Log(string message);

    function funcFoo() public virtual {
        emit Log("A.funcFoo called");
    }

    function funcBar() public virtual {
        emit Log("A.funcBar called");
    }
}

contract B is A {
    function funcFoo() public virtual override {
        emit Log("B.funcFoo called");
        // call directly
        A.funcFoo();
    }

    function funcBar() public virtual override {
        emit Log("B.funcBar called");
        // call use keyword super
        super.funcBar();
    }
}

contract C is A {
    function funcFoo() public virtual override {
        emit Log("C.funcFoo called");
        // call directly
        A.funcFoo();
    }

    function funcBar() public virtual override {
        emit Log("C.funcBar called");
        // call use keyword super
        super.funcBar();
    }
}

contract D is B, C {
    // Try:
    // - Call D.foo and check the transaction logs.
    //   Although D inherits A, B and C, it only called C and then A.
    function funcFoo() public override(B, C) {
        // C.foo()
        // A.foo()
        super.funcFoo();
    }
    // - Call D.bar and check the transaction logs
    //   D called C, then B, and finally A.
    //   Although super was called twice (by B and C) it only called A once.

    function funcBar() public override(B, C) {
        // 1 C.bar()
        // 2 B.bar()
        // 3 A.bar()
        super.funcBar();
    }
}
