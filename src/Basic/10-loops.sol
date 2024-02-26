// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Loops {
    // for loop
    function forLoop(uint256 _n) public pure returns (uint256[] memory) {
        uint256[] memory res = new uint256[](_n);
        for (uint256 i = 0; i < _n; i++) {
            res[i] = i;
            if (i == 3) {
                continue;
            } else if (i > 8) {
                break;
            }
        }

        return res;
    }

    // while loop
    function whileLoop() public pure returns (uint256) {
        uint256 j;
        uint256 res;
        while (j <= 10) {
            j++;
            res += j;
        }
        return res;
    }
}
