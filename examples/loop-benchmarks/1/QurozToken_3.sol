
pragma solidity ^0.5.10;



contract C {
  

  address[] _to;
uint256[] _amount;
string _reason;
uint16 i;

  function foo() public {
    
for(i = 0; i < _to.length; i++){
mint(_to[i], _amount[i], _reason);
}


  }
}

//#LOOPVARS: i

contract string { }
