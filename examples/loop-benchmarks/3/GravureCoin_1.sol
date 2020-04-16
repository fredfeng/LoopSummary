
pragma solidity ^0.5.10;



contract C {
  

  uint[] amounts;
address[] addresses;
mapping(address => transferInStruct[]) transferIns;
uint j;
mapping(address => uint256) balanceOf;
uint64 _now;

  function foo() public {
    
for(j = 0; j < addresses.length; j++){
balanceOf[addresses[j]] = (balanceOf[addresses[j]]) + (amounts[j]);
emit Transfer(msg.sender, addresses[j], amounts[j]);
transferIns[addresses[j]].push(transferInStruct(uint256(amounts[j]), _now));
}


  }
}

//#LOOPVARS: j

contract transferInStruct { }
