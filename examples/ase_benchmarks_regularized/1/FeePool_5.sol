






contract C {
  

  

  uint total;
mapping(bytes4 => uint) rates;
bytes4[] xdrParticipants;

  function foo() public {
    
for(uint i = 0; i < xdrParticipants.length; i++){
total = ((rates[xdrParticipants[i]]) + (total));
}


  }

  

}

//#LOOPVARS: i


