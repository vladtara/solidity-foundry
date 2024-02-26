// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Variables are declared as either storage, memory or calldata to explicitly specify the location of the data.
// storage - variable is a state variable (store on blockchain)
// memory - variable is in memory and it exists while a function is being called
// calldata - special data location that contains function arguments

contract DataLocations {
    uint256[] public arr;
    mapping(uint256 => address) public map;

    struct MyStruct {
        uint256 foo;
    }

    mapping(uint256 => MyStruct) public myStructs;

    function _f(uint256[] storage _arr, mapping(uint256 => address) storage _map, MyStruct storage _myStruct)
        internal
    {
        _arr.push(1);
        _map[1] = msg.sender;
        _myStruct.foo = 33;
    }

    function f() public returns (uint256, MyStruct memory) {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];

        // create a struct in memory
        MyStruct memory myMemStrunct = MyStruct(0);
        myMemStrunct.foo = 2;

        // return data
        return (myStruct.foo, myMemStrunct);
    }

    // You can return memory variables
    function g(uint256[] memory _arr) public pure returns (uint256[] memory) {
        uint256 first = _arr[0];
        uint256 len = _arr.length;
        uint256 last = _arr[len - 1];
        uint256[] memory res = new uint256[](3);
        res[0] = first;
        res[1] = last;
        res[2] = len;
        return res;
    }

    // Use calldata
    function h(uint256[] calldata _arr) external view returns (uint256, address) {
        uint256 res;
        for (uint256 i; i <= (_arr.length - 1); i++) {
            res += _arr[i];
        }
        return (res, msg.sender);
    }
}
