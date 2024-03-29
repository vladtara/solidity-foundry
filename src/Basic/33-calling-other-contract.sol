// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
Contract can call other contracts in 2 ways.
The easiest way to is to just call it, like A.foo(x, y, z).
Another way to call other contracts is to use the low-level call.
This method is not recommended.
*/

contract Callee {
    uint public x;
    uint public value;

    function setX(uint _x) public returns(uint) {
        x = _x;
        return x;
    }

    function setXansSendEther(uint _x) public payable returns(uint,uint) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}


contract Caller {
    function setX0(Callee _callee, uint _x ) public {
        _callee.setX(_x);
    }

    function setX1(address _addr, uint _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }

    function setXandSendEther(Callee _callee, uint _x) public payable returns(uint x,uint value) {
        (x, value) = _callee.setXansSendEther{value: msg.value}(_x);
    }
}
