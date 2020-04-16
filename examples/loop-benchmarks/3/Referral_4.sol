
pragma solidity ^0.5.10;



contract C {
  

  uint start;
Data data;
uint end;
uint investorsBalance;
uint i;
Investors investors;

  function foo() public {
    
for(uint i = start; i < end; i++){
address investor = investors.investors(i);
uint investorPercentage = investors.investorPercentages(investor);
data.addInvestorBalance(investor, investorsBalance * investorPercentage);
}


  }
}

//#LOOPVARS: i

contract Data { }

contract Investors { }
