






contract C {
  

  

  uint nextAvailableBond;
mapping(uint => uint) totalBondDivsETH;
uint bondFund;
uint counter;
mapping(uint => uint) bondPrice;
mapping(address => uint) ownerAccountsETH;
mapping(uint => address) bondOwner;
uint totalBondValue;

  function foo() public {
    
while(counter < nextAvailableBond){
uint _distAmountLocal = ((((bondFund) * (bondPrice[counter]))) / (totalBondValue));
ownerAccountsETH[bondOwner[counter]] = ((ownerAccountsETH[bondOwner[counter]]) + (_distAmountLocal));
totalBondDivsETH[counter] = ((totalBondDivsETH[counter]) + (_distAmountLocal));
counter = counter + 1;
}

  }

  

}

//#LOOPVARS: i


