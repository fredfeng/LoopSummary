






contract C {
  

  

  uint64[] returnIncomingIds;
uint64[] incomingIds;
uint incomingReturnLength;

  function foo() public {
    
for(uint k = 0; k < incomingReturnLength; k = ((k) + (1))){
returnIncomingIds[k] = incomingIds[k];
}


  }

  

}

//#LOOPVARS: k


