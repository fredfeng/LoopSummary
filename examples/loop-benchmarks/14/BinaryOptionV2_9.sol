
pragma solidity ^0.5.10;



contract C {
  

  uint totalNacInPool;
NamiCrowdSale namiToken;
uint rateLoss;
uint rateWin;
Session session;
uint result;
uint i;
uint rateFee;
uint nacReturn;

  function foo() public {
    
for(uint i = 0; i < session.investorCount; i++){
if (session.win[i] == result) {
nacReturn = (session.amountInvest[i] - session.amountInvest[i] * rateFee / 100) * rateWin / 100;
require(namiToken.balanceOf(address(this)) >= nacReturn);
namiToken.transfer(session.investor[i], nacReturn);
totalNacInPool = (totalNacInPool) - ((nacReturn) - (session.amountInvest[i]));
} else {
if (rateLoss > 0) {
nacReturn = (session.amountInvest[i] - session.amountInvest[i] * rateFee / 100) * rateLoss / 100;
require(namiToken.balanceOf(address(this)) >= nacReturn);
namiToken.transfer(session.investor[i], nacReturn);
totalNacInPool = (totalNacInPool) + ((session.amountInvest[i]) - (nacReturn));
} else {
totalNacInPool = (totalNacInPool) + (session.amountInvest[i]);
}

}

session.investor[i] = 0x0;
session.win[i] = 0;
session.amountInvest[i] = 0;
}


  }
}

//#LOOPVARS: i

contract Session { }

contract NamiCrowdSale { }
