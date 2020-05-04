






contract C {
  

  

  uint256[] valueArr;
uint256 valueNow;
uint8[] _steps;
uint8[] _percents;

  function foo() public {
    
for(uint j = 0; j < _steps.length; j++){
valueArr[j] = valueNow * _percents[j] / 100;
}


  }

  

}

//#LOOPVARS: j


