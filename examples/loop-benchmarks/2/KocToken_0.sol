
pragma solidity ^0.5.10;



contract C {
  

  address[] _to;
uint i;
uint256[] _amount;

  function foo() public {
    
for(uint i = 0; i < _to.length; i++){
getVesting(msg.sender);
transfer(_to[i], _amount[i]);
}


  }
}

//#LOOPVARS: i
