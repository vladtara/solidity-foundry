// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
ABI Encode
*/


interface IERC20 {
    function transfer(address, uint) external;
}

contract Token {
    function transfer(address, uint) external {
    }
}

contract AbiEncode {
    function test(address _contract, bytes calldata data) external {
        (bool ok,) = _contract.call(data);
        require(ok, "call failed");
    }

    function encodeWithSignature(address _to, uint _amount) external pure returns(bytes memory) {
        // Typo is not checked - "transfer(address, uint)"
        return abi.encodeWithSignature("transfer(address,uint256)", _to, _amount);
    }

    function encodeWithSelector(address _to, uint _amount) external pure returns(bytes memory) {
        // Type is not checked - (IERC20.transfer.selector, true, amount)
        return abi.encodeWithSelector(IERC20.transfer.selector, _to, _amount);
    }

    function encodeCall(address _to, uint _amount) external pure returns(bytes memory){
        return abi.encodeCall(IERC20.transfer, (_to, _amount));
    }
    
}
