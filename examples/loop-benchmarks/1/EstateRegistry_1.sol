
pragma solidity ^0.5.10;



contract C {
  

  address from;
uint256[] estateIds;
address to;
bytes data;
uint i;

  function foo() public {
    
for(uint i = 0; i < estateIds.length; i++){
safeTransferFrom(from, to, estateIds[i], data);
}


  }
}

//#LOOPVARS: i
