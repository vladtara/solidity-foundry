// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
How to send Ether?
You can send Ether to other contracts by
 - transfer (2300 gas, throws error)
 - send (2300 gas, returns bool)
 - call (forward all gas or set gas, returns bool)

How to receive Ether?
A contract receiving Ether must have at least one of the functions below
 - receive() external payable
 - fallback() external payable
receive() is called if msg.data is empty, otherwise fallback() is called.
msg.data is a special global variable in solidity that contains the complete calldata of the current function call.
It contains data about two things: function selector (the function which is called) + function arguments

Which method should you use?
Call in combination with re-entrancy guard is the recommended method to use after December 2019.
Guard against re-entrancy by
 - making all state changes before calling other contracts
 - using re-entrancy guard modifier

*/


contract ReceiceEther {
        /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}
    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

}


contract SendEther {
    function useTransefer(address payable _to) public payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value);
    }

    function useSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function useCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool ok, ) = _to.call{value: msg.value}("");
        require(ok, "Failed to send Ether");
    }

}