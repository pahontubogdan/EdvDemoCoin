// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.7.0;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  // Restrictions about who can modify the contract's state or call a contract's functions using modifiers
  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() public {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }
}
