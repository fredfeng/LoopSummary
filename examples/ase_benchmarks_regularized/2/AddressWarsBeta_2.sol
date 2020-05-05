






contract C {
  

  

  uint256 ownerCount;
address owner;
address[] owners;

  function foo() public {
    
for(uint256 i = 0; i < owners.length; i++){
if (owner == owners[i]) {
ownerCount++;
}

}


  }

  

}

//#LOOPVARS: i


