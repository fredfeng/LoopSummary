






contract C {
  

  

  uint[] _rates;
mapping(bytes4 => uint) rates;
bytes4[] currencyKeys;

  function foo() public {
    
for(uint8 i = 0; i < currencyKeys.length; i++){
_rates[i] = rates[currencyKeys[i]];
}


  }

  

}

//#LOOPVARS: i


