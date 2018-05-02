pragma solidity ^0.4.19;

import "./BasicToken.sol";

/**
 * @title SimpleToken
 */
contract SimpleMintableToken is BasicToken {

    string public constant name = "SimpleToken";
    string public constant symbol = "SIM";
    uint8 public constant decimals = 18;

    uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals));

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
    */
    function SimpleMintableToken() public {
        owner = msg.sender;
        totalSupply = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        Transfer(0x0, msg.sender, INITIAL_SUPPLY);
    }
}