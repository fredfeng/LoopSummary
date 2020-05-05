






contract C {
  

  

  address[] signers;
uint activeSignersCount;
mapping(address => bool) isSigner;

  function foo() public {
    
for(uint i = 0; i < signers.length; i++){
if (isSigner[signers[i]]) {
require(activeSignersCount > 1, "must not remove last signer");
activeSignersCount--;
isSigner[signers[i]] = false;

}

}


  }

  

}

//#LOOPVARS: i


