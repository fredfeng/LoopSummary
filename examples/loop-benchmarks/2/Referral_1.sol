
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint) investorPercentages;
uint[] _investorPercentages;
address[] _investors;
address[] investors;
uint i;

  function foo() public {
    
for(uint i = 0; i < _investors.length; i++){
investors.push(_investors[i]);
investorPercentages[_investors[i]] = _investorPercentages[i];
}


  }
}

//#LOOPVARS: i
