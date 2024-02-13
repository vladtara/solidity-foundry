// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Loops {
    // for loop
    function forLoop(uint _n) public pure returns (uint[] memory) {
        uint[] memory res = new uint[](_n);
        for(uint i = 0; i < _n; i++) {
            res[i] = i;
            if(i == 3) {
                continue;
            } else if(i >8) {
                break;
            }
        }

        return res;
    }

    // while loop
    function whileLoop() public pure returns (uint) {
        uint j;
        uint res;
        while(j <= 10) {
            j++;
            res += j;
        }
        return res;
    }
}