
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => uint) bondPreviousPrice;
mapping(uint => uint) bondPrice;
mapping(uint => address) bondOwner;
uint halfLifeTime;
uint counter;
mapping(address => uint) ownerAccounts;
uint currentBlock;
mapping(uint => uint) totalBondDivs;
mapping(uint => uint) bondBlockNumber;
uint halfLifeRate;
uint _distDividends;
uint nextAvailableBond;
mapping(uint => uint) basePrice;
uint totalBondValue;
bool allowHalfLife;

  function foo() public {
    
while(counter < nextAvailableBond){
uint _distAmountLocal = SafeMath.div(SafeMath.mul(_distDividends, bondPrice[counter]), totalBondValue);
ownerAccounts[bondOwner[counter]] = SafeMath.add(ownerAccounts[bondOwner[counter]], _distAmountLocal);
totalBondDivs[counter] = SafeMath.add(totalBondDivs[counter], _distAmountLocal);
if (allowHalfLife) {
if (bondPrice[counter] > basePrice[counter]) {
uint _life = SafeMath.sub(currentBlock, bondBlockNumber[counter]);
if (_life > halfLifeTime) {
bondBlockNumber[counter] = currentBlock;
if (SafeMath.div(SafeMath.mul(bondPrice[counter], halfLifeRate), 100) < basePrice[counter]) {
bondPrice[counter] = basePrice[counter];
} else {
bondPrice[counter] = SafeMath.div(SafeMath.mul(bondPrice[counter], halfLifeRate), 100);
bondPreviousPrice[counter] = SafeMath.div(SafeMath.mul(bondPrice[counter], 75), 100);
}

emit Halflife(counter, bondPrice[counter], halfLifeTime);
}

}

}

counter = counter + 1;
}

  }
}

//#LOOPVARS: 
