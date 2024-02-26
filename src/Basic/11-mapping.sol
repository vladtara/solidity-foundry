// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Mapping {
    // Mapping from address to uint
    mapping(address => uint256) public mMap;

    function getMap(address _addr) public view returns (uint256) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        return mMap[_addr];
    }

    function setMap(address _addr, uint256 _uint) public {
        mMap[_addr] = _uint;
    }

    function remove(address _addr) public {
        delete mMap[_addr];
    }
}

contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint256 => bool)) public nested;

    function getMap(address _addr, uint256 _item) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        return nested[_addr][_item];
    }

    function setMap(address _addr, uint256 _item, bool _bool) public {
        nested[_addr][_item] = _bool;
    }

    function remove(address _addr, uint256 _item) public {
        delete nested[_addr][_item];
    }
}
