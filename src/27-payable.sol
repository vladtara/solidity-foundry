// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract PayAble {
    // Payable address can send Ether via transfer or send
    address payable public owner;

    // Payable constructor can receive Ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    // Function to deposit Ether into this contract.
    // Call this function along with some Ether.
    // The balance of this contract will be automatically updated.
    function deposit() public payable {}

    // Call this function along with some Ether.
    // The function will throw an error since this function is not payable.
    function notPatable() public {}

    // Function to withdraw all Ether from this contract.
    function withdraw() public {
        uint amout = address(this).balance;

        (bool ok, ) = owner.call{value: amout}("");
        require(ok,"Failed to send Ether");
    }

    // Function to transfer Ether from this contract to address from input
    function transfer(address payable _to, uint _amount) public {
        // Note that "to" is declared as payable
        (bool ok,) = _to.call{value: _amount}("");
        require(ok,"Failed to send Ether");
    }
}
