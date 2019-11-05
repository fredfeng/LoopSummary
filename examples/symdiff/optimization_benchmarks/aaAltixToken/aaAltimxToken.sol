pragma solidity ^0.5.10;

contract C {

  uint256 public constant Factor = 1000;
  uint256 public tokensInVaults;
  uint256 totalSupply_;
  
  /* modifier lessThanTotalSupply(uint256[] memory _amountOfLands) { */
  function foo(uint256[] memory _amountOfLands) public returns (uint256) {
    uint256 totalAmount = 0;
    for (uint256 i; i < _amountOfLands.length; i++) {
      /* uint256 amount = _amountOfLands[i].mul(Factor); */
      uint256 amount = _amountOfLands[i] * Factor;
      /* totalAmount = totalAmount.add(amount); */
      totalAmount = totalAmount + amount;
    }
    /* require(totalAmount.add(tokensInVaults) <= totalSupply_, 'can not exceed total supply.'); */
    /* require(totalAmount + tokensInVaults <= totalSupply_, 'can not exceed total supply.'); */
    return totalAmount;
    /* _; */
  }
    
}
