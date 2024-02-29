// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
Some gas saving techniques.

    * Replacing memory with calldata
    * Loading state variable to memory
    * Replace for loop i++ with ++i
    * Caching array elements
    * Short circuit
*/

// gas golf
contract GasGolf {
    // start - 50908 gas
    // use calldata - 49163 gas
    // load state variables to memory - 48952 gas
    // short circuit - 48634 gas
    // loop increments - 48244 gas
    // cache array length - 48209 gas
    // load array elements to memory - 48047 gas
    // uncheck i overflow/underflow - 47309 gas
   
    event LogUint(uint i);
    uint public total;

    // not gas optimized
    function sumEven(uint[] memory nums) external {
        total = 0;
        for (uint i; i < nums.length; i++) {
            bool isEven = nums[i] % 2 == 0;
            bool isLess = nums[i] <= 99;
            if (isEven && isLess) {
                total += nums[i];
                emit LogUint(total);
            }
        }
    }
   
   
   
    // gas optimized
    // [1, 2, 3, 4, 5, 100]
    function sumEvenOpt(uint[] calldata nums) external {
        total = 0;
        uint _total = total;
        uint len = nums.length;

        for (uint i; i < len; i++ ) {
            uint num = nums[i];
            if (num % 2 == 0 && num <= 99) {
                _total += num;
                emit LogUint(_total);
            }
        }

        total = _total;
    }
}