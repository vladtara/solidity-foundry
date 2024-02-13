// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//Array can have a compile-time fixed size or a dynamic size.
contract Array {
    // Several ways to initialize an array
    uint256[] public arr;
    uint256[] public arr2 = [1, 3, 4];

    // Fixed sized array, all elements initialize to 0
    uint256[10] public fixArr;

    function getItem(uint256 _item) public view returns (uint256) {
        return arr[_item];
    }

    // Solidity can return the entire array.
    // But this function should be avoided for
    // arrays that can grow indefinitely in length.
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 _item) public {
        // Append to array
        // This will increase the array length by 1.
        arr.push(_item);
    }

    function pop() public {
        // Remove last element from array
        // This will decrease the array length by 1
        arr.pop();
    }

    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 _item) public {
        delete arr[_item];
    }

    function fixedMemArr() external pure returns (uint256[] memory) {
        uint256[] memory arrFix5 = new uint256[](5);
        return arrFix5;
    }
}

// Examples of removing array element
// Remove array element by shifting elements from right to left

contract ArrayByShifting {
    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []

    uint256[] public arr;

    function remove(uint256 _index) public {
        require(_index < arr.length, "Index out of bound!");
        for (uint256 i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop;
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        // [1, 2, 4, 5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [5];
        remove(0);
        //[]
        assert(arr.length == 0);
    }
}

// Remove array element by copying last element into to the place to remove
contract ArratReplaceEnd {
    uint256[] public arr;

    // Deleting an element creates a gap in the array.
    // One trick to keep the array compact is to
    // move the last element into the place to delete.
    function remove(uint256 _index) public {
        arr[_index] = arr[arr.length - 1];
        arr.pop;
    }

    function test() external {
        arr = [1, 2, 3, 4];
        remove(1);
        // [1, 4, 3]
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);
        assert(arr.length == 3);

        remove(2);
        // [1, 4]
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr.length == 2);
    }
}
