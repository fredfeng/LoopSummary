






contract C {
  

  

  uint nextAvailableBond;
uint _totalVal;
uint counter;
mapping(uint => uint) bondPrice;

  function foo() public {
    
while(counter < nextAvailableBond){
_totalVal = ((_totalVal) + (bondPrice[counter]));
counter = counter + 1;
}

  }

  

}

//#LOOPVARS: i


