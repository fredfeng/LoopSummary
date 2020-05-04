






contract C {
  

  

  uint256[] ICObonusStages;

  function foo() public {
    
for(uint y = 1; y < ICObonusStages.length; y++){
ICObonusStages[y] = ((ICObonusStages[y - 1]) + (7 days));
}


  }

  

}

//#LOOPVARS: y


