






contract C {
  

  

  address[] _vendors;
mapping(address => bool) vendors;
uint8 vendorCount;

  function foo() public {
    
for(uint8 i = 0; i < _vendors.length; i++){
vendors[_vendors[i]] = true;
vendorCount++;
}


  }

  

}

//#LOOPVARS: i


