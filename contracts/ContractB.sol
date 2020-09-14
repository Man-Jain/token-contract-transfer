//SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 < 0.7.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./ContractC.sol"

contract ContractB {
  constructor() public {
  }
  
  event ContractCAddress(address contractCAddress);
  event ContractCBalance(uint balance);

  function transferToC(address tokenAddress, uint amount) public {
    IERC20 token = IERC20(tokenAddress);
    
    // Deploy a new Contract C
    ContractC contractc = new ContractC();
    emit ContractCAddress(address(contractc));
    
    uint prevBalance = token.balanceOf(address(contractc));
    emit ContractCBalance(prevBalance);
    
    // Transfer tokens from Contract C
    token.transfer(address(contractc), amount);
    
    uint newBalance = token.balanceOf(address(contractc));
    emit ContractCBalance(newBalance);
  }
}
