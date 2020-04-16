
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256 _dividendValue;
uint256 _supply;
address[] investors;
HRAToken token;

  function foo() public {
    
for(uint8 i = 0; i < investors.length; i++){
uint256 _value = ((((token.balanceOf(investors[i]))) * (_dividendValue))) / (_supply);
dividendTransfer(investors[i], _value);
}


  }
}

//#LOOPVARS: i

contract HRAToken { }
