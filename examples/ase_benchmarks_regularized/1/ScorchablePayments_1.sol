






contract C {
  

  

  uint64[] outgoingIds;
uint outgoingReturnLength;
uint64[] returnOutgoingIds;

  function foo() public {
    
for(uint j = 0; j < outgoingReturnLength; j = ((j) + (1))){
returnOutgoingIds[j] = outgoingIds[j];
}


  }

  

}

//#LOOPVARS: j


