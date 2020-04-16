
pragma solidity ^0.5.10;



contract C {
  

  uint256 _dividendIndex;
Dividend dividend;
uint256 i;
uint256 _iterations;
uint256 _start;
address securityToken;
uint256 numberInvestors;

  function foo() public {
    
for(uint256 i = _start; i < Math.min256(numberInvestors, (_start) + (_iterations)); i++){
address payee = ISecurityToken(securityToken).investors(i);
if (!dividend.claimed[payee]) {
_payDividend(payee, dividend, _dividendIndex);
}

}


  }
}

//#LOOPVARS: i

contract Dividend { }
