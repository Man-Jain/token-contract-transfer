//SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 < 0.7.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Token.sol is ERC20 {
  constructor() ERC20("Sample Network Token", "SNT") public {
  }

  function mint(address mintTo, uint amount) public {
      _mint(minTo, amount);
  }
}
