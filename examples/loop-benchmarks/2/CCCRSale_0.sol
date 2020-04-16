
pragma solidity ^0.5.10;



contract C {
  

  uint256 arrayLength;
CCCRCoin tokenReward;
uint256[] arrayAmount;
uint256 i;
address[] arrayAddress;

  function foo() public {
    
while(i <= arrayLength){
tokenReward.transfer(arrayAddress[i], arrayAmount[i]);
i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract CCCRCoin { }
