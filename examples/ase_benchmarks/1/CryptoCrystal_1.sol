






contract C {
  

  

  uint256[] _crystalWeightsCumsum;
uint256[] crystalWeights;

  function foo() public {
    
for(uint256 i = 1; i < 100; i++){
_crystalWeightsCumsum[i] = ((_crystalWeightsCumsum[i - 1]) + (crystalWeights[i]));
}


  }

  

}

//#LOOPVARS: i


