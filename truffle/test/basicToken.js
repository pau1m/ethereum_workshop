//const assertJump = require('./helpers/assertJump');

//var BasicTokenMock = artifacts.require("./helpers/BasicTokenMock.sol");

contract('SimpleToken', function(accounts) {


  const BasicToken = artifacts.require('SimpleToken')

  let token

  beforeEach(async function () {
    token = await BasicToken.new()
  });

  it("should return the correct totalSupply after construction", async function() {
    let totalSupply = await token.totalSupply()
    assert.deepEqual(totalSupply, new web3.BigNumber('10000000000000000000000'))
  })

  it("should return correct balances after transfer", async function() {

    let amount = '1000000000000000000'
    
    let account0before = await token.balanceOf(accounts[0])
    
    // Transfer
    let transfer = await token.transfer(accounts[1], amount)
    
    let event = transfer.logs[0].args

    assert.equal(event.from, accounts[0])
    assert.equal(event.to, accounts[1])
    assert.equal(event.value.toString(), amount)

    let account0After = await token.balanceOf(accounts[0])
    let account1After = await token.balanceOf(accounts[1])

    assert.deepEqual(account0After, new web3.BigNumber('9999000000000000000000'))
    assert.deepEqual(account1After, new web3.BigNumber(amount))


    //@todo check balance of second account is '1000000000000000000'
    //@todo make number comparisons easier to read

    // assert.equal(firstAccountBalance, 0);

    // let secondAccountBalance = await token.balanceOf(accounts[1]);
    // assert.equal(secondAccountBalance, 100);
  });

  //@todo test minting function
  //@todo test own function

//   it("should throw an error when trying to transfer more than balance", async function() {
//     let token = await BasicTokenMock.new(accounts[0], 100);
//     try {
//       let transfer = await token.transfer(accounts[1], 101);
//       assert.fail('should have thrown before');
//     } catch(error) {
//       assertJump(error);
//     }    
//   });

})