






contract C {
  

  

  address[] assets;
address[] _assets;

  function foo() public {
    
for(uint256 i = 0; i < assets.length; i++){
require(_assets[i] == assets[i]);
}


  }

  

}

//#LOOPVARS: i


