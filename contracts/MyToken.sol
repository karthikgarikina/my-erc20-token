// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract MyToken {
    // Token metadata

    //token name
    string public name = "MyToken";

    // Short ticker symbol
    string public symbol = "MTK";

    // Number of decimal places
    // 18 is the standard in Ethereum (1 token = 10^18 smallest units)
    uint8 public decimals = 18;

    // Total supply of tokens in smallest units (e.g., "wei" for your token)
    uint256 public totalSupply;

    // Balances & Allowances

    // Mapping from address to token balance
    mapping(address => uint256) public balanceOf;

    // Nested mapping: owner => (spender => remaining allowance)
    mapping(address => mapping(address => uint256)) public allowance;

    // Events

    /**
     * @dev Emitted when `value` tokens are moved from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // --------------------
    // Constructor
    // --------------------

    /**
     * @dev Constructor that mints `_initialSupply` tokens to the deployer.
     * @param _initialSupply Total supply in smallest units
     *
     * Example:
     *  - If you want 1,000,000 tokens and decimals = 18,
     *    pass: 1_000_000 * 10**18  (i.e., 1000000000000000000000000)
     */
    constructor(uint256 _initialSupply) {
        require(_initialSupply > 0, "Initial supply must be > 0");

        totalSupply = _initialSupply;

        // Assign entire supply to the contract deployer (msg.sender)
        balanceOf[msg.sender] = _initialSupply;

        // Emit a Transfer event from address(0) to show minting
        emit Transfer(address(0), msg.sender, _initialSupply);
    }

    // --------------------
    // Core ERC-20 Functions
    // --------------------

    /**
     * @dev Transfer tokens from the caller to another address.
     * @param _to Recipient address
     * @param _value Amount to transfer (in smallest units)
     * @return success True if transfer succeeded
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // Cannot send to zero address (would effectively burn tokens)
        require(_to != address(0), "Cannot transfer to zero address");

        // Check that the sender has enough balance
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        // Update balances
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        // Emit the Transfer event (required by ERC-20)
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    /**
     * @dev Approve another address to spend tokens on your behalf.
     * @param _spender Address that will be allowed to spend
     * @param _value Maximum amount they can spend
     * @return success True if approval succeeded
     */
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0), "Cannot approve zero address");

        // Set the allowance
        allowance[msg.sender][_spender] = _value;

        // Emit Approval event (required by ERC-20)
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    /**
     * @dev Transfer tokens from one address to another using an allowance.
     * Caller must have sufficient allowance from `_from`.
     * @param _from Address tokens are taken from
     * @param _to Address tokens are sent to
     * @param _value Amount to transfer
     * @return success True if transfer succeeded
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_from != address(0), "From address cannot be zero");
        require(_to != address(0), "Cannot transfer to zero address");

        // Check _from has enough balance
        require(balanceOf[_from] >= _value, "Insufficient balance");

        // Check msg.sender is allowed to spend this much from _from
        uint256 currentAllowance = allowance[_from][msg.sender];
        require(currentAllowance >= _value, "Insufficient allowance");

        // Update balances
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        // Decrease the allowance
        allowance[_from][msg.sender] = currentAllowance - _value;

        // Emit Transfer event
        emit Transfer(_from, _to, _value);

        return true;
    }

    // --------------------
    // Helper / View Functions (Optional but nice)
    // --------------------

    /**
     * @dev Returns the total supply. (Already public, but explicit function is clear.)
     */
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    /**
     * @dev Returns token metadata in one call.
     */
    function getTokenInfo()
        public
        view
        returns (string memory, string memory, uint8, uint256)
    {
        return (name, symbol, decimals, totalSupply);
    }
}
