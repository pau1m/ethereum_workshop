pragma solidity ^0.4.18;

/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances.
 */
contract BasicToken {

mapping(address => uint) balances;

    uint public totalSupply;

    event Transfer(address indexed from, address indexed to, uint256 value);

  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender] -= _value;
        balances[_to] = balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
    function balanceOf(address _owner) public view returns (uint balance) {
        return balances[_owner];
    }
}

/**
 * @title SimpleToken
 */
contract SimpleToken is BasicToken {

    string public constant name = "WorkshopToken";
    string public constant symbol = "WTX";
    uint8 public constant decimals = 18;

    uint public constant INITIAL_SUPPLY = 10000 * (10 ** uint(decimals));

  /**
   * @dev Constructor that gives msg.sender all of existing tokens.
   */
    function SimpleToken() public {
        totalSupply = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        emit Transfer(0x0, msg.sender, INITIAL_SUPPLY);
    }
}