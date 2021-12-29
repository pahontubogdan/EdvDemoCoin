// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.7.0;

import "./ConvertLib.sol";


contract EdvDemoCoin {
	// Basically a map with account and balances
	mapping (address => uint) balances;

	// Transfer function
	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	// Constructor - initiates the origin with 10000 
	constructor() public {
		// tx.origin - the original external account that started the transaction
		// msg.sender - the account that invokes the function.
		// The tx.origin variable will always refer to the external account while msg.sender can be a contract or external account
		// https://ethereum.stackexchange.com/questions/1891/whats-the-difference-between-msg-sender-and-tx-origin
		balances[tx.origin] = 10000;
	}

	// Function to send some coin
	function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		// msg.sender - the accounts that invokes the function
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;

		// emit actually triggers the log saving on blockchain
		emit Transfer(msg.sender, receiver, amount);
		return true;
	}

	
	function getBalanceInEth(address addr) public view returns(uint){
		return ConvertLib.convert(getBalance(addr),2);
	}

	function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}
}
