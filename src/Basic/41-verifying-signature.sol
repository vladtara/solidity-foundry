// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/*
Messages can be signed off chain and then verified on chain using a smart contract.
*/

/* Signature Verification

How to Sign and Verify
# Signing
1. Create message to sign
2. Hash the message
3. Sign the hash (off chain, keep your private key secret)

# Verify
1. Recreate hash from the original message
2. Recover signer from signature and hash
3. Compare recovered signer to claimed signer
*/

contract VerifySignature {
    /* 1. Unlock MetaMask account
    ethereum.enable()
    */

    /* 2. Get message hash to sign
    getMessageHash(
        0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C,
        123,
        "coffee and donuts",
        1
    )

    hash = "0xcf36ac4f97dc10d91fc2cbb20d718e94a8cbfe0f82eaedc6a4aa38946fb797cd"
           "0x56f00a5093efc595178316938b3e9ab51b37610ca57b1b471aa4ce801f05251d"
    */

    function getMessageHash(
        address _to,
        uint _amount,
        string calldata _msg,
        uint _nonce
    ) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_to,_amount,_msg,_nonce));
    }

    /* 3. Sign message hash
    # using browser
    account = "copy paste account of signer here"
    ethereum.request({ method: "personal_sign", params: [account, hash]}).then(console.log)

    # using web3
    web3.personal.sign(hash, web3.eth.defaultAccount, console.log)

    web3.eth.accounts.sign('Some data', '0x4c0883a69102937d6231471b5dbb6204fe5129617082792ae468d01a3f362318');

    Signature will be different for different accounts
    0x993dab3dd91f5c6dc28e17439be475478f5635c92a56e17e82349d3fb2f166196f466c0b4e0c146f285204f0dcb13e5ae67bc33f4b888ec32dfe0a063e8f3f781b
    0x68712a97a320ea79ae1143e5374029d52384ae84fef06424da1f2e00a2339a2d6d4c497d005aadfc69cd9cf4b7a267d6afe5cbb426219eb8313cc8b74a4020aa1b
    */
    function getEthSignedMessageHash(
        bytes32 _msgHash
    ) public pure returns(bytes32) {
        return keccak256(
            abi.encodePacked("\x19Ethereum Signed Message:\n32", _msgHash)
        );
    }

    /* 4. Verify signature
    signer = 0xB273216C05A8c0D4F0a4Dd0d7Bae1D2EfFE636dd
    to = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C
    amount = 123
    message = "coffee and donuts"
    nonce = 1
    signature =
        0x993dab3dd91f5c6dc28e17439be475478f5635c92a56e17e82349d3fb2f166196f466c0b4e0c146f285204f0dcb13e5ae67bc33f4b888ec32dfe0a063e8f3f781b
    
    web3.eth.accounts.sign('Some data', '0x4c0883a69102937d6231471b5dbb6204fe5129617082792ae468d01a3f362318');

    */
    function verify(
        address _signer,
        address _to,
        uint _amount,
        string calldata _msg,
        uint _nonce,
        bytes calldata _signature
    ) public pure returns(bool) {
        bytes32 msgHash = getMessageHash(_to, _amount, _msg, _nonce);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(msgHash);

        return recoverSignature(ethSignedMessageHash, _signature) == _signer;
    }


    function recoverSignature(
        bytes32 _ethSignedMessageHash,
        bytes calldata _signature
    ) public pure returns(address) {
        require(_signature.length == 65, "Invalid signature Length");
        bytes memory signature = _signature;
        bytes32 r;
        bytes32 s;
        uint8 v;
        assembly {
            /*
            First 32 bytes stores the length of the signature

            add(sig, 32) = pointer of sig + 32
            effectively, skips first 32 bytes of signature

            mload(p) loads next 32 bytes starting at the memory address p into memory
            */
            // first 32 bytes, after the length prefix
            r := mload(add(signature, 32))
            // second 32 bytes
            s := mload(add(signature, 64))
            // final byte (first byte of the next 32 bytes)
            v := byte(0, mload(add(signature, 96))) 
        }
        // assembly {
        //     // Copy the signature from calldata to memory
        //     r := calldataload(add(_signature.offset, 32))
        //     s := calldataload(add(_signature.offset, 64))
        //     v := byte(0, calldataload(add(_signature.offset, 96)))
        // }

        return ecrecover(_ethSignedMessageHash, v, r, s);  
    }
}
