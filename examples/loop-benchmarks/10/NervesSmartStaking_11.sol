
pragma solidity ^0.5.10;



contract C {
  

  uint totalTokensDeposited;
uint p;
uint EthBonus;
address[] usersList;
mapping(address => User) users;

  function foo() public {
    
while(p < usersList.length && msg.gas > 90000){
User currentUser = users[usersList[p]];
uint amount = 0;
for (uint q = 0; q < currentUser.contributions.length; q++) {
if (now > currentUser.contributions[q].time + 85 days) {
amount = amount.add(currentUser.contributions[q].amount);
}

}

if (amount >= 200000000 * (10 ** 18)) {
uint EthToSend = ((EthBonus) * (amount)) / (totalTokensDeposited);
require(address(this).balance >= EthToSend);
currentUser.user.transfer(EthToSend);
}

p++;
}

  }
}

//#LOOPVARS: 

contract User { }
