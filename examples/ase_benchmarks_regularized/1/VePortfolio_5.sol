






contract C {
  

  

  mapping(address => uint) model;
address[] assets;

  function foo() public {
    
for(uint256 i = 0; i < assets.length; i++){
delete model[assets[i]];
}


  }

  

}

//#LOOPVARS: i


