pragma solidity >=0.4.25 <0.7.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/EdvDemoCoin.sol";

contract TestEDVDemoCoin {

  function testInitialBalanceUsingDeployedContract() public {
    EdvDemoCoin edvCoin = EdvDemoCoin(DeployedAddresses.EdvDemoCoin());

    uint expected = 10000;

    Assert.equal(edvCoin.getBalance(tx.origin), expected, "Owner should have 10000 EDVDemoCoin initially");
  }

  function testInitialBalanceWithNewEdvDemoCoin() public {
    EdvDemoCoin edvCoin = new EdvDemoCoin();

    uint expected = 10000;

    Assert.equal(edvCoin.getBalance(tx.origin), expected, "Owner should have 10000 EDVDemoCoin initially");
  }

}
