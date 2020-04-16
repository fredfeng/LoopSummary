
pragma solidity ^0.5.10;



contract C {
  

  uint counter;
mapping(address => uint) ownerAccounts;
address dev;
uint _distFactor;
mapping(uint => address) levelOwner;
uint _distDividends;
uint nextAvailableLevel;
mapping(uint => uint) totalLevelDivs;

  function foo() public {
    
while(counter < nextAvailableLevel){
uint _distAmountLocal = SafeMath.div(_distDividends, _distFactor);
ownerAccounts[levelOwner[counter]] = SafeMath.add(ownerAccounts[levelOwner[counter]], _distAmountLocal);
totalLevelDivs[counter] = SafeMath.add(totalLevelDivs[counter], _distAmountLocal);
counter = counter + 1;
ownerAccounts[dev] = SafeMath.sub(ownerAccounts[dev], _distAmountLocal);
_distFactor = SafeMath.div(SafeMath.mul(_distFactor, 112), 100);
}

  }
}

//#LOOPVARS: 
