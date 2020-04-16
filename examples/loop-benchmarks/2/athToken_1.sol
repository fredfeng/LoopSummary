
pragma solidity ^0.5.10;



contract C {
  

  bytes32[] invoicesStack;
address buyer;
bool find;
bytes32 PASS2;
Helper helper;
uint i;

  function foo() public {
    
for(uint i = 0; i < invoicesStack.length; i++){
if (helper.generatePASS2(invoicesStack[i], buyer) == PASS2) {
find = true;
break;
}

}


  }
}

//#LOOPVARS: i

contract Helper { }
