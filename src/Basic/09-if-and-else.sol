// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IfElse {
    function barIfElse(uint256 _x) public pure returns (uint256) {
        if (_x < 10) {
            return 0;
        } else if (_x < 20) {
            return 1;
        } else {
            return 100;
        }
    }

    function barTernary(uint256 _x) public pure returns (uint256) {
        return _x < 10 ? 100 : 200;
    }
}
