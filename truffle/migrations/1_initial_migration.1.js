const Migrations = artifacts.require("Migrations");
const SimpleMintableToken = artifacts.require('SimpleMintableToken')

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(SimpleMintableToken)
}
