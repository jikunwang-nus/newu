// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Pelican {
  string public app_name = "Pelican";
  string public symbol = "PLCN";

  // Totol token count
  uint256 public totalToken = 1000000;

  // address of the account
  address public owner;

  // mapping from address to the account's balance
  mapping(address => uint256) balances;

  // transfer event
  event _transfer(address from, address to, uint256 value);

  constructor() {
    balances[msg.sender] = totalToken;
    owner = msg.sender;
  }

  function transfer(address to, uint256 value) external {
    require(balances[msg.sender] >= value, "Not enough token");
    balances[msg.sender] -= value;
    balances[to] += value;
    emit _transfer(msg.sender, to, value);
  }
  function balance(address account) external view returns (uint256) {
    return balances[account];
  }
}
