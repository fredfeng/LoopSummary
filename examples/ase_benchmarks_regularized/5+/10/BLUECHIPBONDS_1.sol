






contract C {
  

  

  uint nextAvailableBond;
uint halfLifeRate;
mapping(uint => uint) bondPreviousPrice;
uint currentBlock;
mapping(uint => uint) basePrice;
uint halfLifeTime;
uint counter;
mapping(uint => uint) bondPrice;
bool allowHalfLife;
mapping(uint => uint) bondBlockNumber;

  function foo() public {
    
while(counter < nextAvailableBond){
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


