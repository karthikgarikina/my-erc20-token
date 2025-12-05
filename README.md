# MyToken (MTK)

## Overview

MyToken is a simple ERC-20 compatible token built on the Ethereum blockchain for learning purposes.  
It demonstrates how standard fungible tokens work under the hood using Solidity smart contracts.

## Token Details

- **Name**: MyToken  
- **Symbol**: MTK  
- **Decimals**: 18  
- **Total Supply**: 1,000,000 MTK  
- **Initial Distribution**: Entire supply is minted to the deployer address

## What is an ERC-20 Token?

ERC-20 is a technical standard for fungible tokens on Ethereum.  
It defines a common interface (functions + events) so wallets, exchanges, and dApps can:

- Query balances
- Transfer tokens
- Approve third parties to spend tokens
- Track transfers via events

MyToken implements the core ERC-20 functions:

- `totalSupply`
- `balanceOf`
- `transfer`
- `approve`
- `allowance`
- `transferFrom`
- `Transfer` and `Approval` events

## Features

- ✅ Fixed total supply  
- ✅ Standard ERC-20 interface  
- ✅ Transfer tokens between addresses  
- ✅ Allowance-based spending with `approve` / `transferFrom`  
- ✅ Event emission for all transfers and approvals  
- ✅ Input validation (zero address, insufficient balance, insufficient allowance)  
- ✅ Written with Solidity ^0.8.x (built-in overflow/underflow checks)

## Contract Source

- Located at: `contracts/MyToken.sol`
- Compiler version: `^0.8.20`

## How to Deploy (RemixIDE)

1. Open [RemixIDE](https://remix.ethereum.org/).
2. Create a new file: `contracts/MyToken.sol`.
3. Paste the contract code.
4. Open the **Solidity Compiler** tab:
   - Select compiler version `0.8.x`
   - Click **Compile MyToken.sol**
5. Open **Deploy & Run Transactions** tab:
   - Environment: `JavaScript VM`
   - Contract: `MyToken`
   - Constructor parameter `_initialSupply`:
     - For 1,000,000 MTK with 18 decimals:  
       `1000000000000000000000000`
   - Click **Deploy**

## Usage Examples

### Check Total Supply

```solidity
totalSupply() // returns uint256
