// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// try / catch can only catch errors from external function calls and contract creation.

// External contract used for try / catch examples
contract Foo {
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0), "Invalid address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    function myFunc(uint _x) public pure returns (string memory) {
        require(_x != 0, "_X mast be grate than 0");
        return "myFanc was called";
    }
}

contract Bar {
    event Log(string msg);
    event LogBytes(bytes data);

    Foo public foo;

    constructor() {
        // This Foo contract is used for example of try catch with external call
        foo = (new Foo)(msg.sender);
    }
    // Example of try / catch with external call
    // tryCatchExternalCall(0) => Log("external call failed"")
    // tryCatchExternalCall(1) => Log("myFanc was called")
    function tryCatchExternalCall(uint _n) public {
        try foo.myFunc(_n) returns (string memory result) {
            emit Log(result);
        } catch {
            emit Log("external call failed");
        }
    }

    // Example of try / catch with contract creation
    // tryCatchNewContract(0x0000000000000000000000000000000000000000) => Log("invalid address")
    // tryCatchNewContract(0x0000000000000000000000000000000000000001) => LogBytes("")
    // tryCatchNewContract(0x0000000000000000000000000000000000000002) => Log("Foo created")
    function tryCatchNewContract(address _owner) public {
        try (new Foo)(_owner) {
            // you can use variable foo here
            foo.myFunc(1);
            emit Log("Foo created");
        } catch Error(string memory res) {
            // catch failing revert() and require()
            emit Log(res);
        } catch (bytes memory res) {
            // catch failing assert()
            emit LogBytes(res);
        }
    }
}
