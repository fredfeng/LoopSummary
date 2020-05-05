






contract C {
  

  

  uint256[] _alloc;
uint total;
mapping(address => uint) model;
address[] _assets;

  function foo() public {
    
for(uint256 i = 0; i < _assets.length; i++){
uint256 alloc = _alloc[i];
address asset = _assets[i];
total = ((total) + (alloc));
model[asset] = alloc;
}


  }

  

}

//#LOOPVARS: i


