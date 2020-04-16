
pragma solidity ^0.5.10;



contract C {
  

  uint bondFund;
mapping(uint => uint) bondPrice;
mapping(uint => uint) totalBondDivsETH;
mapping(uint => address) bondOwner;
mapping(address => uint) ownerAccountsETH;
uint counter;
uint nextAvailableBond;
uint totalBondValue;

  function foo() public {
    
while(counter < nextAvailableBond){
uint _distAmountLocal = SafeMath.div(SafeMath.mul(bondFund, bondPrice[counter]), totalBondValue);
ownerAccountsETH[bondOwner[counter]] = SafeMath.add(ownerAccountsETH[bondOwner[counter]], _distAmountLocal);
totalBondDivsETH[counter] = SafeMath.add(totalBondDivsETH[counter], _distAmountLocal);
counter = counter + 1;
}

  }
}

//#LOOPVARS: 
