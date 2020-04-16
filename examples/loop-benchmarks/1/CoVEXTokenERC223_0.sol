
pragma solidity ^0.5.10;



contract C {
  

  uint256 tokenAmount;
mapping(uint => uint) weeklyRewards;
uint i;
uint256 startTimestamp;

  function foo() public {
    
for(uint i = 1; i <= 4; i++){
if (now <= startTimestamp + 7 days) {
return ((tokenAmount) * (100 + weeklyRewards[i])) / (100);
}

}


  }
}

//#LOOPVARS: i
