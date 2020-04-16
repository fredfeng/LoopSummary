
pragma solidity ^0.5.10;



contract C {
  

  address dropWallet;
mapping(address => uint256) balances;
uint256 bonusETH;
uint256 bonusCRS;
address[] winners;
uint winList;
uint256 amount;

  function foo() public {
    
for(uint winList = 0; winList < winners.length; winList++){
winners[winList].transfer((bonusETH) / (64));
balances[winners[winList]] = balances[winners[winList]] + amount;
bonusETH -= (bonusETH) / (64);
if (balances[dropWallet] >= amount) {
balances[dropWallet] = balances[dropWallet] - amount;
balances[winners[winList]] = balances[winners[winList]] + (bonusCRS) / (64);
bonusCRS -= (bonusCRS) / (64);
}

Transfer(dropWallet, msg.sender, amount);
}


  }
}

//#LOOPVARS: winList
