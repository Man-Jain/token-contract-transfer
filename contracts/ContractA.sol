//SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 < 0.7.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./ContractB.sol";

contract ContractA {
  constructor() public {
  }

  address contractBaddress = address(0xc0f2C83a5E0Db5c9A9E5556E6bE0DB35b4d8ae77);

  function depositTokens(address tokenAddress, uint amount) public {
    IERC20 token = IERC20(tokenAddress);
    
    // Transfer Tokens from User to This Contract
    token.transferFrom(msg.sender, address(this), amount);
    
    ContractB contractb = ContractB(contractBaddress);
    token.approve(address(contractb), amount);
    
    // Transfer to Contract B
    token.transfer(contractBaddress, amount);
    
    // Call Contract B function that transfers to Contract C
    contractb.transferToC(tokenAddress, amount);
  }
}
