pragma solidity ^0.4.19;

/**
 * @title Basic token
 */
contract BasicToken {

    mapping(address => uint256) balances;

    uint256 public totalSupply;
    address public owner;

    event Transfer(address indexed from, address indexed to, uint256 value);

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

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
        Transfer(msg.sender, _to, _value);
        return true;
    }

    /**
     * @dev Gets the balance of the specified address.
     * @param _owner The address to query the the balance of.
     * @return An uint256 representing the amount owned by the passed address.
     */
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function mint(address _beneficiary, uint _value) public onlyOwner {
        balances[_beneficiary] += _value;
        totalSupply += _value;
        Transfer(0x0,_beneficiary, _value);
    }
}

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