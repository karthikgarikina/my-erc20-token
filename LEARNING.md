# 📘 Learning Notes – My First ERC-20 Token Project

This was my great time working with blockchain and Solidity.  
Before this task, I only knew tokens at a surface level (like using crypto),  
but I never understood how they are created or how they work internally.  
By building this ERC-20 token, I clearly understood the basics and the workflow of a smart contract.

---

## 🏁 What I Started With

- No prior blockchain or smart-contract experience
- Never created a token before
- Only basic programming knowledge
- Didn't know about supply, decimals, transferFrom, or allowances

---

## 🧠 What I Learned from this Project

### 1. What an ERC-20 Token Actually Is
- ERC-20 is a **standard rule set** for fungible tokens on Ethereum.
- Tokens are not just numbers — they are **stored and controlled by smart contracts**.

### 2. Token Components
I learned that a token has:

| Part | Meaning |
|------|---------|
| **name** | Friendly name (MyToken) |
| **symbol** | Short code like MTK |
| **decimals** | Smallest unit count (18 is common) |
| **totalSupply** | Total tokens that exist |

### 3. How Balances Work
- Balances are stored using `mapping(address => uint256)`.
- The contract tracks **which address owns how many tokens**.

### 4. Transfer Function
- Lets a user send tokens to another address.
- Must check balance before sending.
- I tested normal transfers successfully.

### 5. Approve & transferFrom
At first this was confusing, but later I understood:

- `approve` → Give permission to someone to spend my tokens.
- `transferFrom` → That person actually spends them using permission.

Now I know **why wallets need allowance** for exchanges and dApps.

### 6. Events
- `Transfer` and `Approval` events appear in logs.
- They help track transactions on blockchain explorers.

### 7. Remix IDE Usage
I learned how to:

- Write a Solidity file
- Compile it
- Deploy using JavaScript VM
- Interact with functions
- Test success + failure cases

It felt like a hands-on mini blockchain playground.

---

## 🧪 What I Tested

- Checking token name, symbol, decimals, total supply
- balanceOf for different accounts
- transfer() working
- approve() then transferFrom()
- Error tests:
  - transfer to zero address (failed as expected)
  - spending more than balance → failed
  - using transferFrom without enough allowance → failed

This made me understand smart contract conditions better.

---

## 🎉 Final Understanding

After completing this task:

- I understand how tokens operate internally.
- I know how ERC-20 functions connect together.
- I realized blockchain isn't magic — it's just code with rules.
- Now I can create, deploy, and test a basic token confidently.

My knowledge moved from **"0 idea" → "now I can explain how an ERC-20 token works"**.

---

Overall, this was a very good step into blockchain development.  
This project helped me understand tokens practically rather than just reading.

