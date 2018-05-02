//const Migrations = artifacts.require("./Migrations.sol");
var SimpleMintableToken = artifacts.require('SimpleMintableToken')

module.exports = function(deployer) {
 // deployer.deploy(Migrations);
  deployer.deploy(SimpleMintableToken)
}
