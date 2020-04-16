
pragma solidity ^0.5.10;



contract C {
  

  Team wt;
uint winTeamAmount;
mapping(address => uint256) payOuts;
uint winnings;
uint i;

  function foo() public {
    
for(uint i = 0; i < wt.bettors.length; i++){
uint betSize = wt.bettorAmount[wt.bettors[i]];
uint percentage = (SafeMath) / ((betSize * 100), winTeamAmount);
uint payOut = winnings * percentage;
payOuts[wt.bettors[i]] = SafeMath.div(payOut, 100) + betSize;
}


  }
}

//#LOOPVARS: i

contract Team { }
