






contract C {
  

  

  uint256[] _value;
uint256 i;
uint256 totalValue;

  function foo() public {
    
while(i < _value.length){
totalValue = ((totalValue) + (_value[i]));
i++;
}

  }

  

}

//#LOOPVARS: i


