// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/*
Bitwise operations are fundamental operations that work directly on the binary representation of numbers. 
In Solidity, as in many other programming languages, you have several bitwise operators 
that allow you to manipulate individual bits within a data type, such as uint256. 

AND (&): This operator takes two numbers as operands and performs 
a logical AND operation on each pair of corresponding bits. 
The result is 1 if both bits are 1, otherwise, it's 0. 
For example:
uint256 a = 12; // 1100 in binary
uint256 b = 10; // 1010 in binary
uint256 result = a & b; // result is 8 (1000 in binary)


OR (|): This operator performs a logical OR operation on each pair of corresponding bits. 
The result is 1 if at least one of the bits is 1, otherwise, it's 0. 
For example:
uint256 a = 12; // 1100 in binary
uint256 b = 10; // 1010 in binary
uint256 result = a | b; // result is 14 (1110 in binary)


XOR (^): This operator performs a logical XOR (exclusive OR) operation on each pair of corresponding bits. 
The result is 1 if the bits are different, otherwise, it's 0. 
For example:
uint256 a = 12; // 1100 in binary
uint256 b = 10; // 1010 in binary
uint256 result = a ^ b; // result is 6 (0110 in binary)

NOT (~): This unary operator inverts each bit of its operand. 
If the bit is 1, it becomes 0, and if it's 0, it becomes 1. 
For example:
uint256 a = 12; // 1100 in binary
uint256 result = ~a; // result is a large number, as all bits are inverted

Left Shift (<<): This operator shifts all bits of its first operand to the left 
by the number of positions specified by the second operand. 
Bits shifted off to the left are discarded, and zeros are shifted in from the right. 
For example:
uint256 a = 3; // 0011 in binary
uint256 result = a << 2; // result is 12 (1100 in binary)


Right Shift (>>): This operator shifts all bits of its first operand to the 
right by the number of positions specified by the second operand.
Bits shifted off to the right are discarded, and the sign bit is shifted 
in from the left (for signed numbers) or zeros are shifted in (for unsigned numbers). 
For example:
uint256 a = 12; // 1100 in binary
uint256 result = a >> 2; // result is 3 (0011 in binary)

Bitwise operations are often used in low-level programming, 
such as manipulating flags, masks, or specific bits within a data type. 
They can be very efficient because they operate directly on the binary representation of numbers.
*/

//Bitwise Operators
contract BitwiseOps {
    // x     = 1110 = 8 + 4 + 2 + 0 = 14
    // y     = 1011 = 8 + 0 + 2 + 1 = 11
    // x & y = 1010 = 8 + 0 + 2 + 0 = 10
    function and(uint256 x, uint256 y) external pure returns (uint256) {
        return x & y;
    }

    // x     = 1100 = 8 + 4 + 0 + 0 = 12
    // y     = 1001 = 8 + 0 + 0 + 1 = 9
    // x | y = 1101 = 8 + 4 + 0 + 1 = 13
    function or(uint256 x, uint256 y) external pure returns (uint256) {
        return x | y;
    }

    // x     = 1100 = 8 + 4 + 0 + 0 = 12
    // y     = 0101 = 0 + 4 + 0 + 1 = 5
    // x ^ y = 1001 = 8 + 0 + 0 + 1 = 9
    function xor(uint256 x, uint256 y) external pure returns (uint256) {
        return x ^ y;
    }

    // x  = 00001100 =   0 +  0 +  0 +  0 + 8 + 4 + 0 + 0 = 12
    // ~x = 11110011 = 128 + 64 + 32 + 16 + 0 + 0 + 2 + 1 = 243
    function not(uint8 x) external pure returns (uint8) {
        return ~x;
    }

    // 1 << 0 = 0001 --> 0001 = 1
    // 1 << 1 = 0001 --> 0010 = 2
    // 1 << 2 = 0001 --> 0100 = 4
    // 1 << 3 = 0001 --> 1000 = 8
    // 3 << 2 = 0011 --> 1100 = 12
    function shiftLeft(uint256 x, uint256 bits)
        external
        pure
        returns (uint256)
    {
        return x << bits;
    }

    // 8  >> 0 = 1000 --> 1000 = 8
    // 8  >> 1 = 1000 --> 0100 = 4
    // 8  >> 2 = 1000 --> 0010 = 2
    // 8  >> 3 = 1000 --> 0001 = 1
    // 8  >> 4 = 1000 --> 0000 = 0
    // 12 >> 1 = 1100 --> 0110 = 6
    function shiftRight(uint256 x, uint256 bits)
        external
        pure
        returns (uint256)
    {
        return x >> bits;
    }

    // Get last n bits from x
    function getLastNBits(uint256 x, uint256 n)
        external
        pure
        returns (uint256)
    {
        // Example, last 3 bits
        // x        = 1101 = 13
        // mask     = 0111 = 7
        // x & mask = 0101 = 5
        uint256 mask = (1 << n) - 1;
        return x & mask;
    }

    // Get last n bits from x using mod operator
    function getLastNBitsUsingMod(uint256 x, uint256 n)
        external
        pure
        returns (uint256)
    {
        // 1 << n = 2 ** n
        return x % (1 << n);
    }

    // Get position of most significant bit
    // x = 1100 = 10, most significant bit = 1000, so this function will return 3
    function mostSignificantBit(uint256 x) external pure returns (uint256) {
        uint256 i = 0;
        while ((x >>= 1) > 0) {
            ++i;
        }
        return i;
    }

    // Get first n bits from x
    // len = length of bits in x = position of most significant bit of x, + 1
    function getFirstNBits(uint256 x, uint256 n, uint256 len)
        external
        pure
        returns (uint256)
    {
        // Example
        // x        = 1110 = 14, n = 2, len = 4
        // mask     = 1100 = 12
        // x & mask = 1100 = 12
        uint256 mask = ((1 << n) - 1) << (len - n);
        return x & mask;
    }
}

//Most significant bit
contract MostSignificantBitFunction {
    // Find most significant bit using binary search
    function mostSignificantBit(uint256 x)
        external
        pure
        returns (uint256 msb)
    {
        // x >= 2 ** 128
        if (x >= 0x100000000000000000000000000000000) {
            x >>= 128;
            msb += 128;
        }
        // x >= 2 ** 64
        if (x >= 0x10000000000000000) {
            x >>= 64;
            msb += 64;
        }
        // x >= 2 ** 32
        if (x >= 0x100000000) {
            x >>= 32;
            msb += 32;
        }
        // x >= 2 ** 16
        if (x >= 0x10000) {
            x >>= 16;
            msb += 16;
        }
        // x >= 2 ** 8
        if (x >= 0x100) {
            x >>= 8;
            msb += 8;
        }
        // x >= 2 ** 4
        if (x >= 0x10) {
            x >>= 4;
            msb += 4;
        }
        // x >= 2 ** 2
        if (x >= 0x4) {
            x >>= 2;
            msb += 2;
        }
        // x >= 2 ** 1
        if (x >= 0x2) msb += 1;
    }
}

//Most significant bit in assembly
contract MostSignificantBitAssembly {
    function mostSignificantBit(uint256 x)
        external
        pure
        returns (uint256 msb)
    {
        assembly {
            let f := shl(7, gt(x, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))
            x := shr(f, x)
            // or can be replaced with add
            msb := or(msb, f)
        }
        assembly {
            let f := shl(6, gt(x, 0xFFFFFFFFFFFFFFFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        assembly {
            let f := shl(5, gt(x, 0xFFFFFFFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        assembly {
            let f := shl(4, gt(x, 0xFFFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        assembly {
            let f := shl(3, gt(x, 0xFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        assembly {
            let f := shl(2, gt(x, 0xF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        assembly {
            let f := shl(1, gt(x, 0x3))
            x := shr(f, x)
            msb := or(msb, f)
        }
        assembly {
            let f := gt(x, 0x1)
            msb := or(msb, f)
        }
    }
}