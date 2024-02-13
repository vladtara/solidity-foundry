// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Functions and state variables have to declare whether they are accessible by other contracts.

// Functions can be declared as
// public - any contract and account can call
// private - only inside the contract that defines the function
// internal- only inside contract that inherits an internal function
// external - only other contracts and accounts can call


contract Base {
    // State variables
    string private privateVar = "Private Variable";
    string internal internalVar = "Interanl Variable";
    string public publicVar = "Public Variable";
    // State variables cannot be external so this code won't compile.
    // string external externalVar = "my external variable";


    // Private function can only be called
    // - inside this contract
    // Contracts that inherit this contract cannot call this function.
    function privatFunc() private pure returns(string memory) {
        return "Private func";
    }

    function testPrivatFunc() public pure returns(string memory) {
        return privatFunc();
    }


    // Internal function can be called
    // - inside this contract
    // - inside contracts that inherit this contract  
    function internalFunc() internal pure returns(string memory) {
        return "Internal func";
    }

    function testInternalFunc()public pure virtual returns(string memory) {
        return internalFunc();
    }

    // Public functions can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    // - by other contracts and accounts
    function publicFunc() public pure returns(string memory) {
        return "Public func";
    }

    // External functions can only be called
    // - by other contracts and accounts
    function externalFunk() external pure returns(string memory) {
        return "External func";
    }
    // This function will not compile since we're trying to call
    // an external function here.
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

}

contract Child is Base {
    // Inherited contracts do not have access to private functions
    // and state variables.
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }

    // Internal function call be called inside child contracts.
    function testInternalFunc() public pure override returns(string memory) {
        return internalFunc();
    }

    function getPrivateVar() public view returns(string memory) {
        return internalVar;
    }
}