
pragma solidity ^0.5.10;



contract C {
  

  uint256 balance;
address _address;
uint256 userROIMultiplier;
uint256 step;
uint256 percent;
mapping(address => uint256) investments;
uint i;

  function foo() public {
    
for(uint i = 1; i < userROIMultiplier; i = i * 2){
percent = ((investments[_address]) * (step)) / (1000) * i;
balance += ((percent) * (60)) / (1440);
}


  }
}

//#LOOPVARS: i
