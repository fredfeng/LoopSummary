
pragma solidity ^0.5.10;



contract C {
  

  uint total82Tokens;
uint counter;
uint _ethToPay;
mapping(uint => uint) theGroupofEightyTwoAmount;

  function foo() public {
    
while(counter > 0){
uint _distAmountLocal = SafeMath.div(SafeMath.mul(_ethToPay, theGroupofEightyTwoAmount[counter]), total82Tokens);
purchaseTokensfor82(_distAmountLocal, 0x0, counter);
counter = counter - 1;
}

  }
}

//#LOOPVARS: 
