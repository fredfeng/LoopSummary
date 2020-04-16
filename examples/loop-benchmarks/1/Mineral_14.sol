
pragma solidity ^0.5.10;



contract C {
  

  uint32 d;
mapping(uint32 => uint) dayAverageOutput;

  function foo() public {
    
for(d >= 0; --d){
if (dayAverageOutput[d] != 0) {
break;
}

}


  }
}

//#LOOPVARS: 
