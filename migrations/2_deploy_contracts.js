const ConvertLib = artifacts.require("ConvertLib");
const EdvDemoCoin = artifacts.require("EdvDemoCoin");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  // link the library with the contract
  deployer.link(ConvertLib, EdvDemoCoin);
  deployer.deploy(EdvDemoCoin);
};
