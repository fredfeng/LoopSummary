
pragma solidity ^0.5.10;



contract C {
  

  uint256[] dividends;
uint i;
User user;

  function foo() public {
    
for(uint i = 0; i < user.deposits.length; i++){
uint256 duration = (now) - (user.lastPayment);
dividends[i] = dividendsForAmountAndTime(user.deposits[i].rate, user.deposits[i].amount, duration);
}


  }
}

//#LOOPVARS: i

contract User { }
