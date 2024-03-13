// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract AssemblyVariable {
    function yul() public pure returns (uint z) {
        assembly {
            // Language used for assembly is called Yul
            // Local variables
            let x := 123
            z := 345
        }
    }
}
