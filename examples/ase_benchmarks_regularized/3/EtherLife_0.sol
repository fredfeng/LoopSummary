






contract C {
  

  

  mapping(address => address) parents;
address current;
address[] refLevels;

  function foo() public {
    
for(uint8 i = 0; i < 5; i++){
current = parents[current];
if (current == address(0)) break;

refLevels[i] = current;
}


  }

  

}

//#LOOPVARS: i


