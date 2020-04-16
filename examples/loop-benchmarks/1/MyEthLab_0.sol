
pragma solidity ^0.5.10;



contract C {
  

  uint256[] dividends;
uint i;
User user;

  function foo() public {
    
for(uint i = 0; i < dividends.length; i++){
emit DepositDividendPayed(msg.sender, i, user.deposits[i].amount, user.deposits[i].rate, dividends[i]);
}


  }
}

//#LOOPVARS: i

contract User { }
