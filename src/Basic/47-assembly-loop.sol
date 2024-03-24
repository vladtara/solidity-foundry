// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract AssemblyLoop {
    function for_loop() public pure returns (uint z) {
        assembly {
            for {
                let i := 0
            } lt(i, 20) {
                i := add(i, 1)
            } {
                z := add(z, 10)
            }
        }
    }

    function while_loop() public pure returns (uint z) {
        assembly {
            let i := 0
            for {

            } lt(i, 20) {
                i := add(i, 1)
            } {
                z := add(z, 10)
            }
        }
    }
}
