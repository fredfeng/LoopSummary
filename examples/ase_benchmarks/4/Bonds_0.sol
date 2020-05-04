






contract C {
  

  

  uint nextAvailableBond;
mapping(uint => uint) totalBondDivs;
uint _distDividends;
mapping(address => uint) ownerAccounts;
uint counter;
mapping(uint => uint) bondPrice;
mapping(uint => address) bondOwner;
uint totalBondValue;

  function foo() public {
    
while(counter < nextAvailableBond){
uint _distAmountLocal = ((((_distDividends) * (bondPrice[counter]))) / (totalBondValue));
ownerAccounts[bondOwner[counter]] = ((ownerAccounts[bondOwner[counter]]) + (_distAmountLocal));
totalBondDivs[counter] = ((totalBondDivs[counter]) + (_distAmountLocal));
counter = counter + 1;
}

  }

  

}

//#LOOPVARS: i


