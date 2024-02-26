// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Primitivs {
    bool public boo = true;
    uint8 public u8 = 8;
    uint256 public u256 = 256;
    uint256 public u = 256;
    int8 public i8 = 8;
    int256 public i256 = 128;
    int256 public i = -128;

    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    address public addr2 = 0x0000000000000000000000000000000000000000;

    bytes1 a = 0xb5;

    // Defaults
    bool dfBool = false;
    uint256 dfUint = 0;
    int256 dfInt = 0;
    address dfAddt = 0x0000000000000000000000000000000000000000;
}
