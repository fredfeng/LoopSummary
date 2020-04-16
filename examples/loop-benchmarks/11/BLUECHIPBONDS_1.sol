
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => uint) bondPreviousPrice;
mapping(uint => uint) bondPrice;
uint halfLifeTime;
uint counter;
uint currentBlock;
mapping(uint => uint) bondBlockNumber;
uint halfLifeRate;
mapping(uint => uint) basePrice;
uint nextAvailableBond;
bool allowHalfLife;

  function foo() public {
    
while(counter < nextAvailableBond){
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
