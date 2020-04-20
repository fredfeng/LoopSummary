
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
mapping(address => bool) whitelist;
address[] _addrs;

  function foo() public {
    
for(uint8 i = 0; i < _addrs.length; i++){
if (!whitelist[_addrs[i]]) {
whitelist[_addrs[i]] = true;
}

}


  }
}

//#LOOPVARS: i
