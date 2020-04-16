
pragma solidity ^0.5.10;



contract C {
  

  Dividend dividend;
address[] _payees;
uint256 _dividendIndex;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _payees.length; i++){
if (!dividend.claimed[_payees[i]]) {
_payDividend(_payees[i], dividend, _dividendIndex);
}

}


  }
}

//#LOOPVARS: i

contract Dividend { }
