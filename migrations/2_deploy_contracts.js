var MyToken = artifacts.require("./MyToken.sol");
var MyTokenSale = artifacts.require("./MyTokenSale.sol");

module.exports = function(deployer) {
  deployer.deploy(MyToken, 1000000).then(function() {
  	//token price is 0.001 Ether
  	var tokenPrice = 1000000000000000;
  	return deployer.deploy(MyTokenSale, MyToken.address, tokenPrice);
  });
  
};