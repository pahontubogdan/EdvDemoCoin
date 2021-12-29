pragma solidity >=0.4.25 <0.7.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/EdvDemoCoin.sol";

contract TestEdvDemoCoin {
  // Test not working here
  function testInitialBalanceUsingDeployedContract() public {
    EdvDemoCoin edv = EdvDemoCoin(DeployedAddresses.EdvDemoCoin());

    uint expected = 10000;

    Assert.equal(edv.getBalance(tx.origin), expected, "Owner should have 10000 EDVDemoCoin initially");
  }

  function testInitialBalanceWithNewEdvDemoCoin() public {
    EdvDemoCoin edv = new EdvDemoCoin();

    uint expected = 10000;

    Assert.equal(edv.getBalance(tx.origin), expected, "Owner should have 10000 EDVDemoCoin initially");
  }

}
