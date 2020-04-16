
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => address) cardOwner;
uint halfLifeTime;
uint insurancePayoutRate;
uint counter;
uint nextAvailableCard;
uint currentBlock;
mapping(address => uint) ownerAccounts;
mapping(uint => uint) cardPreviousPrice;
mapping(uint => uint) cardPrice;
uint halfLifeRate;
mapping(uint => uint) cardInsurance;
uint halfLifeReductionRate;
mapping(uint => uint) basePrice;
uint tempInsurance;
mapping(uint => uint) cardBlockNumber;
uint insurancePayout;
bool allowHalfLife;

  function foo() public {
    
while(counter < nextAvailableCard){
if (allowHalfLife) {
if (cardPrice[counter] > basePrice[counter]) {
uint _life = SafeMath.sub(currentBlock, cardBlockNumber[counter]);
if (_life > halfLifeTime) {
cardBlockNumber[counter] = currentBlock;
if (SafeMath.div(SafeMath.mul(cardPrice[counter], halfLifeRate), 1000) < basePrice[counter]) {
cardPrice[counter] = basePrice[counter];
insurancePayout = SafeMath.div(SafeMath.mul(cardInsurance[counter], insurancePayoutRate), 1000);
cardInsurance[counter] = SafeMath.sub(cardInsurance[counter], insurancePayout);
ownerAccounts[cardOwner[counter]] = SafeMath.add(ownerAccounts[cardOwner[counter]], insurancePayout);
} else {
cardPrice[counter] = SafeMath.div(SafeMath.mul(cardPrice[counter], halfLifeRate), 1000);
cardPreviousPrice[counter] = SafeMath.div(SafeMath.mul(cardPrice[counter], halfLifeReductionRate), 1000);
insurancePayout = SafeMath.div(SafeMath.mul(cardInsurance[counter], insurancePayoutRate), 1000);
cardInsurance[counter] = SafeMath.sub(cardInsurance[counter], insurancePayout);
ownerAccounts[cardOwner[counter]] = SafeMath.add(ownerAccounts[cardOwner[counter]], insurancePayout);
}

emit onInsuranceChange(0x0, counter, cardInsurance[counter]);
emit Halflife(cardOwner[counter], counter, cardPrice[counter], halfLifeTime + block.number, insurancePayout, cardInsurance[counter]);
}

}

}

tempInsurance = tempInsurance + cardInsurance[counter];
counter = counter + 1;
}

  }
}

//#LOOPVARS: 
