
pragma solidity ^0.5.10;



contract C {
  

  uint256 arrayLength;
uint256[] arrayAmount;
uint256 i;
address[] arrayAddress;
Token3DAPP tokenReward;

  function foo() public {
    
while(i <= arrayLength){
tokenReward.transfer(arrayAddress[i], arrayAmount[i]);
i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract Token3DAPP { }
