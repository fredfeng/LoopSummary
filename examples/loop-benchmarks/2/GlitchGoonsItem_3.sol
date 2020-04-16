
pragma solidity ^0.5.10;



contract C {
  

  uint k;
uint i;
bytes bstr;

  function foo() public {
    
while(i != 0){
bstr[k--] = byte(48 + i % 10);
i /= 10;
}

  }
}

//#LOOPVARS: 
