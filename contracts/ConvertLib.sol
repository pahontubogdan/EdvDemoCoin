// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.7.0;

library ConvertLib{
	// PURE functions: DO NOT read or modify the state variables
	// Example: 2 numbers SUM
	function convert(uint amount,uint conversionRate) public pure returns (uint convertedAmount)
	{
		return amount * conversionRate;
	}
}
