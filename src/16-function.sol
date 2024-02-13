// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Functions {
    // Functions can return multiple values.
    function returnMany() public pure returns(uint,bool,uint) {
        return (22, true, 44);
     }

    // Return values can be named. 
    function retrunNamed() public pure returns(uint x, bool y, uint q) {
        return (33, true, 66);
    }

    // Return values can be assigned to their name.
    // In this case the return statement can be omitted.
    function retunAssignedNamed() public pure returns(uint x, bool y, uint q) {
        x = 44;
        y = true;
        q = 88;
    }

    // Use destructuring assignment when calling another
    // function that returns multiple values.
    function destructuringAssignments() public pure returns(uint,bool,uint,uint,uint) {
        // Destructuring 
        (uint i, bool b, uint j) = retrunNamed();

        // Values can be left out.
        (uint x, ,uint y) = (4,5,6);
        return (i,b,j,x,y);
    }

//    
// Cannot use map for either input or output    
//
    // Can use array for input
    function arryInput(uint[] memory _arr) public {}
    function arryInput(uint[] calldata _arr, uint[] memory _arr2) public {}

    // Can use array for output
    uint[] public arr;

    function arrayOutput(uint[] calldata _arr) public view returns(uint[] memory callData, uint[] memory locaStorage) {
        callData = _arr;
        locaStorage = arr;
    }


    // Call function with key-value inputs

    function manyInputs(
        uint a,
        uint x,
        address addr,
        bool b,
        string memory str
    ) public pure returns(uint) {
        b;
        str;
        addr;
        return a + x;
    }

    function callFunc() public pure returns(uint) {
        return manyInputs(1,2,address(1),false,"test");
    }

    function callFuncKeyValue() public pure returns(uint) {
        return manyInputs({
            addr: address(3), 
            str: "test22", 
            b: false,
            x: 44, 
            a:123});
    }
}
