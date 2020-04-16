
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => uint) bondPrice;
mapping(uint => address) bondOwner;
uint counter;
mapping(address => uint) ownerAccounts;
mapping(uint => uint) totalBondDivs;
uint _distDividends;
uint nextAvailableBond;
uint totalBondValue;

  function foo() public {
    
while(counter < nextAvailableBond){
uint _distAmountLocal = SafeMath.div(SafeMath.mul(_distDividends, bondPrice[counter]), totalBondValue);
ownerAccounts[bondOwner[counter]] = SafeMath.add(ownerAccounts[bondOwner[counter]], _distAmountLocal);
totalBondDivs[counter] = SafeMath.add(totalBondDivs[counter], _distAmountLocal);
counter = counter + 1;
}

  }
}

//#LOOPVARS: 
