
pragma solidity ^0.5.10;



contract C {
  

  IMultiToken mtkn;
uint256 sumWeight;
uint i;

  function foo() public {
    
for(uint i = mtkn.changeableTokenCount(); i > 0; i--){
sumWeight += mtkn.weights(mtkn.tokens(i - 1));
}


  }
}

//#LOOPVARS: i

contract IMultiToken { }
