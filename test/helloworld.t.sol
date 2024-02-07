// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {HelloWorld} from "../src/helloworld.sol";

contract HelloWorldTest is Test {
    HelloWorld public hw;

    function test_greet() public {
        hw = new HelloWorld();
        assertEq(hw.greet(), "Hello world");
    }
}
