






contract C {
  

  

  uint256[] ICObonusStages;
uint256 stage;
uint256 timeStamp;

  function foo() public {
    
for(uint i = 0; i < ICObonusStages.length; i++){
if (timeStamp <= ICObonusStages[i]) {
stage = i + 1;
break;
}

}


  }

  

}

//#LOOPVARS: i


