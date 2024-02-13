// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Variables are declared as either storage, memory or calldata to explicitly specify the location of the data.
// storage - variable is a state variable (store on blockchain)
// memory - variable is in memory and it exists while a function is being called
// calldata - special data location that contains function arguments

contract DataLocations {

    uint[] public arr;
    mapping(uint => address) public map;

    struct MyStruct {
        uint foo;

    }

    mapping(uint => MyStruct) public myStructs;


    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        _arr.push(1);
        _map[1] = msg.sender;
        _myStruct.foo = 33;
    }

    function f() public returns (uint, MyStruct memory) {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];

        // create a struct in memory
        MyStruct memory myMemStrunct = MyStruct(0);
        myMemStrunct.foo = 2;
        
        // return data
        return (myStruct.foo,myMemStrunct);
    }

    // You can return memory variables
    function g(uint[] memory _arr) public pure returns(uint[] memory) {
        uint first = _arr[0];
        uint len = _arr.length;
        uint last = _arr[len-1];
        uint[] memory res = new uint[](3);
        res[0] = first;
        res[1] = last;
        res[2] = len;
        return res;
    }

    // Use calldata 
    function h(uint[] calldata _arr) external view returns(uint, address) {
        uint res;
        for(uint i; i <= (_arr.length - 1); i++) {
            res += _arr[i];
        }
        return (res, msg.sender);
    }
}
