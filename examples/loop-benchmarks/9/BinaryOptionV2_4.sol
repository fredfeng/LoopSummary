
pragma solidity ^0.5.10;



contract C {
  

  bool result;
uint rateLoss;
NamiCrowdSale namiContract;
Session session;
uint rateWin;
uint etherToBuy;
uint i;
uint rateFee;

  function foo() public {
    
for(uint i = 0; i < session.investorCount; i++){
if (session.win[i] == result) {
etherToBuy = (session.amountInvest[i] - session.amountInvest[i] * rateFee / 100) * rateWin / 100;
uint etherReturn = session.amountInvest[i] - session.amountInvest[i] * rateFee / 100;
(session.investor[i]).transfer(etherReturn);
} else {
etherToBuy = (session.amountInvest[i] - session.amountInvest[i] * rateFee / 100) * rateLoss / 100;
}

namiContract.buy.value(etherToBuy)(session.investor[i]);
session.investor[i] = 0x0;
session.win[i] = false;
session.amountInvest[i] = 0;
}


  }
}

//#LOOPVARS: i

contract Session { }

contract NamiCrowdSale { }
