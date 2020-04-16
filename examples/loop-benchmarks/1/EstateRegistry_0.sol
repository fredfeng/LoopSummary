
pragma solidity ^0.5.10;



contract C {
  

  address destinatary;
uint256[] landIds;
uint length;
uint256 estateId;
uint i;

  function foo() public {
    
for(uint i = 0; i < length; i++){
_transferLand(estateId, landIds[i], destinatary);
}


  }
}

//#LOOPVARS: i
