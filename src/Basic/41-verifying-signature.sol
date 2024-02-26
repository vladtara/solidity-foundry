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