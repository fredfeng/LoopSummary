pragma solidity ^0.5.10;

contract C {
  
  uint256 strt;
  uint256 end;
  mapping(uint256 => uint256) arr;
  
  function foo() public {
    for (uint i = strt; i < end; i++) {
      arr[i] = arr[i+1];
    }
  }
}
