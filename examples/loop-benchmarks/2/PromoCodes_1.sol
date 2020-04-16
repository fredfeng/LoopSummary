
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => Investor) investors;
uint i;
address _investor;

  function foo() public {
    
for(uint i = 0; i < investors[_investor].tokensPurchases.length; i++){
if (investors[_investor].tokensPurchases[i].value == 0) {
continue;
}

_refundTokensPurchase(_investor, i);
}


  }
}

//#LOOPVARS: i

contract Investor { }
