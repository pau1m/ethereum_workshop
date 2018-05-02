contract('SimpleToken', function(accounts) {


  const SimpleMintableToken = artifacts.require('SimpleMintableToken')

  let token

  beforeEach(async function () {
    token = await SimpleMintableToken.new()
  });

  it("should return the correct totalSupply after construction", async function() {
    let totalSupply = await token.totalSupply()
    assert.deepEqual(totalSupply, new web3.BigNumber('10000000000000000000000'))
  })

  it("should have correct balances after transfer", async function() {

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

  });

  // Add test for minting
  // Add test for any custom code
  // Test any single lines of code
  // Test boundaries eg attempting to send greater than balance
  // Test expected default values are present and correct
  // Test possible paths through a function

  // And then...
  // Post gist or pastie of working code in chat channel
  // ```[code]``` Three back ticks should force

})