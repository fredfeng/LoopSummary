






contract C {
  

  

  mapping(uint => uint) totalBondDivs;
mapping(uint => uint) bondPreviousPrice;
uint currentBlock;
bool allowHalfLife;
uint nextAvailableBond;
uint halfLifeRate;
uint halfLifeTime;
uint totalBondValue;
uint _distDividends;
uint counter;
mapping(uint => uint) bondPrice;
mapping(uint => uint) bondBlockNumber;
mapping(address => uint) ownerAccounts;
mapping(uint => uint) basePrice;
mapping(uint => address) bondOwner;

  function foo() public {
    
while(counter < nextAvailableBond){
uint _distAmountLocal = ((((_distDividends) * (bondPrice[counter]))) / (totalBondValue));
ownerAccounts[bondOwner[counter]] = ((ownerAccounts[bondOwner[counter]]) + (_distAmountLocal));
totalBondDivs[counter] = ((totalBondDivs[counter]) + (_distAmountLocal));
if (allowHalfLife) {
if (bondPrice[counter] > basePrice[counter]) {
uint _life = ((currentBlock) - (bondBlockNumber[counter]));
if (_life > halfLifeTime) {
bondBlockNumber[counter] = currentBlock;
if (((((bondPrice[counter]) * (halfLifeRate))) / (100)) < basePrice[counter]) {
bondPrice[counter] = basePrice[counter];
} else {
bondPrice[counter] = ((((bondPrice[counter]) * (halfLifeRate))) / (100));
bondPreviousPrice[counter] = ((((bondPrice[counter]) * (75))) / (100));
}


}

}

}

counter = counter + 1;
}

  }

  

}

//#LOOPVARS: i


