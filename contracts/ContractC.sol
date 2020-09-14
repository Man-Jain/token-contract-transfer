//SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 < 0.7.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ContractC {
  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function getOwner() public view returns(address) {
    return owner;
  }
}
