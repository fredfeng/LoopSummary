
pragma solidity ^0.5.10;



contract C {
  

  uint32 ctr;
address children;
mapping(address => address) rightbrother;

  function foo() public {
    
while(children != 0x0000000000000000000000000000000000000000){
ctr += getTotalNodeCount(children);
children = rightbrother[children];
}

  }
}

//#LOOPVARS: 
