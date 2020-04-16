
pragma solidity ^0.5.10;



contract C {
  

  address _address;
uint index;
uint i;
mapping(address => TransferInStructToken[]) transferInsToken;

  function foo() public {
    
for(uint i = index; i < transferInsToken[_address].length - 1; i++){
transferInsToken[_address][i] = transferInsToken[_address][i + 1];
}


  }
}

//#LOOPVARS: i

contract TransferInStructToken { }
