
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
Holder[] holders;
uint256 _targetTotalSupply;
uint256 coeff;
ERC20Basic _token;

  function foo() public {
    
for(uint8 i = 0; i < holders.length; i++){
uint256 holderAmount = ((_targetTotalSupply) * (uint256(holders[i].ratio))) / (coeff);
deliverTokens(_token, holders[i].addr, holderAmount);
}


  }
}

//#LOOPVARS: i

contract Holder { }

contract ERC20Basic { }
