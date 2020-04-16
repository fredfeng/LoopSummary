
pragma solidity ^0.5.10;



contract C {
  

  Datasets.Beter[] winBetters;
uint winAmount;
uint i;
uint256 len;

  function foo() public {
    
for(uint i = 0; i < len; i++){
winAmount += winBetters[i].amount;
}


  }
}

//#LOOPVARS: i

contract Datasets.Beter { }
