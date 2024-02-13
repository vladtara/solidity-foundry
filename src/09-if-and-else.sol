// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract IfElse {
    function barIfElse(uint _x) public pure returns (uint) {
        if (_x < 10) {
            return 0;
        } else if (_x < 20) {
            return 1;
        } else {
            return 100;
        }
    }

    function barTernary(uint _x) public pure returns (uint) {
        return _x < 10 ? 100 : 200;
        
    } 
}