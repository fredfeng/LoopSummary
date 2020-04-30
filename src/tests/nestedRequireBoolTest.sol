pragma solidity ^0.5.10;

contract C {

  uint256 i;
  uint256 strt;
  uint256 end;
  address[] addrs;
  mapping(address => bool) boolArr; 
  
  function foo() public {
    for (i = strt; i < end; ++i) {
      require(boolArr[addrs[i]]);
    }
  }
}
