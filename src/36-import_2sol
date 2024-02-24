// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/*
You can import local and external files in Solidity.
Local
Here is our folder structure.

├── 36-import_1.sol
└── 36-import_2.sol
*/


// import Foo.sol from current directory
import "./36-import_1.sol";

// import {symbol1 as alias, symbol2} from "filename";
import {Unauthorized, add as funcAdd, Point} from "./36-import_1.sol";

contract Import {
    Foo public foo = new Foo();


    // Test Foo.sol by getting it's name.
    function getFooName() public view returns(string memory) {
        return foo.name();
    }

    // Test add fun from Foo
    function getFooAdd(uint _x, uint _y) public pure returns(uint) {
        return funcAdd(_x,_y);
    }
}


/*
External
You can also import from GitHub by simply copying the url

// https://github.com/owner/repo/blob/branch/path/to/Contract.sol
import "https://github.com/owner/repo/blob/branch/path/to/Contract.sol";

// Example import ECDSA.sol from openzeppelin-contract repo, release-v4.5 branch
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol";


*/
