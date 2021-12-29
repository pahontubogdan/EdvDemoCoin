const EdvDemoCoin = artifacts.require("EdvDemoCoin");

contract('EdvDemoCoin', (accounts) => {
  it('should put 10000 EdvDemoCoin in the first account', async () => {
    const EdvDemoCoinInstance = await EdvDemoCoin.deployed();
    const balance = await EdvDemoCoinInstance.getBalance.call(accounts[0]);

    assert.equal(balance.valueOf(), 10000, "10000 wasn't in the first account");
  });
  it('should call a function that depends on a linked library', async () => {
    const EdvDemoCoinInstance = await EdvDemoCoin.deployed();
    const EdvDemoCoinBalance = (await EdvDemoCoinInstance.getBalance.call(accounts[0])).toNumber();
    const EdvDemoCoinEthBalance = (await EdvDemoCoinInstance.getBalanceInEth.call(accounts[0])).toNumber();

    assert.equal(EdvDemoCoinEthBalance, 2 * EdvDemoCoinBalance, 'Library function returned unexpected function, linkage may be broken');
  });
  it('should send coin correctly', async () => {
    const EdvDemoCoinInstance = await EdvDemoCoin.deployed();

    // Setup 2 accounts.
    const accountOne = accounts[0];
    const accountTwo = accounts[1];

    // Get initial balances of first and second account.
    const accountOneStartingBalance = (await EdvDemoCoinInstance.getBalance.call(accountOne)).toNumber();
    const accountTwoStartingBalance = (await EdvDemoCoinInstance.getBalance.call(accountTwo)).toNumber();

    // Make transaction from first account to second.
    const amount = 10;
    await EdvDemoCoinInstance.sendCoin(accountTwo, amount, { from: accountOne });

    // Get balances of first and second account after the transactions.
    const accountOneEndingBalance = (await EdvDemoCoinInstance.getBalance.call(accountOne)).toNumber();
    const accountTwoEndingBalance = (await EdvDemoCoinInstance.getBalance.call(accountTwo)).toNumber();


    assert.equal(accountOneEndingBalance, accountOneStartingBalance - amount, "Amount wasn't correctly taken from the sender");
    assert.equal(accountTwoEndingBalance, accountTwoStartingBalance + amount, "Amount wasn't correctly sent to the receiver");
  });
});
