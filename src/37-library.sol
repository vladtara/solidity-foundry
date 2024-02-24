// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
Libraries are similar to contracts, but you can't declare any state variable and you can't send ether.
A library is embedded into the contract if all library functions are internal.
Otherwise the library must be deployed and then linked before the contract is deployed.
*/


library Math {
    function sqrt(uint _x) internal pure returns(uint z) {
        if (_x > 3) {
            z = _x;
            uint x = _x / 2 +1;
            while (x < z) {
                z = x;
                x = (_x / x + x) / 2; 
            }
        } else if ( _x != 0 ) {
            z = 1;
        } else {
            // defult behavior
            z = 0;
        }
    }
}


contract TestMath {

    // use sintax suger for calling func from lib
    using Math for uint;    
    function testSqrt1(uint _x) public pure returns(uint) {
        return _x.sqrt();
    }

    // direct call func from lib
    function testSqrt2(uint _x) public pure returns(uint) {
        return Math.sqrt(_x);
    }
}


library ArrayRange {
    function remove(uint[] storage arr, uint index) public {
        // Move the last element into the place to delete
        require(arr.length > 0, "Can't remove from empty array");
        arr[index] = arr[arr.length -1];
        arr.pop();
    }
}

contract TestArrayRange {
    event ArrayStatus(uint[] arr);
    using ArrayRange for uint[];

    uint[] public arr;

    function testArrayRemove() public returns(uint[] memory) {
        for (uint i; i < 5; i++) {
            arr.push(i);
        }
        emit ArrayStatus(arr);

        arr.remove(3);
        emit ArrayStatus(arr);

        arr.remove(1);
        emit ArrayStatus(arr);
        return arr;        
    }
}
