// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Variables {
    //State vars store on blockchain
    string public text = "test";
    uint256 public number = 123;

    function doFunction() public pure returns (int256) {
        // Local var
        int256 i = 1;

        return i;
    }

    // Global vars from blockchain
    uint256 public timeStemp = block.timestamp;
    address public sender = payable(msg.sender);
}
