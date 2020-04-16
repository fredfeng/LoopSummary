
pragma solidity ^0.5.10;



contract C {
  

  uint bonusRate;
ERC20 token;
address[] usersList;
mapping(address => User) users;
uint i;

  function foo() public {
    
while(i < usersList.length && msg.gas > 90000){
User currentUser = users[usersList[i]];
uint amount = 0;
for (uint q = 0; q < currentUser.contributions.length; q++) {
if (now > currentUser.contributions[q].time + 24 hours && now < currentUser.contributions[q].time + 84 days) {
amount = amount.add(currentUser.contributions[q].amount);
}

}

if (amount >= 40000 * (10 ** 18) && amount < 50000 * (10 ** 18)) {
uint bonus = ((amount) * (bonusRate)) / (10000);
require(token.balanceOf(address(this)) >= bonus);
currentUser.totalBonusReceived = (currentUser.totalBonusReceived) + (bonus);
require(token.transfer(currentUser.user, bonus));
}

i++;
}

  }
}

//#LOOPVARS: 

contract ERC20 { }

contract User { }
