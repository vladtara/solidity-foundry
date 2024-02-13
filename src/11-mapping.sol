// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Mapping {
    // Mapping from address to uint
    mapping(address => uint) public mMap;

    function getMap(address _addr ) public view returns (uint) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        return mMap[_addr];
    }

    function setMap(address _addr, uint _uint) public {
        mMap[_addr] = _uint;
    }

    function remove(address _addr) public {
        delete mMap[_addr];
    }
}

contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)    
    mapping(address => mapping(uint => bool)) public nested;

    function getMap(address _addr, uint _item) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        return nested[_addr][_item];
    }

    function setMap(address _addr, uint _item, bool _bool) public {
        nested[_addr][_item] = _bool;
    }

    function remove(address _addr, uint _item) public {
        delete nested[_addr][_item];
    }
}
