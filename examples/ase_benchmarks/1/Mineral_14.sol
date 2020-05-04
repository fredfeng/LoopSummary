






contract C {
  

  

  mapping(uint32 => uint) dayAverageOutput;
uint32 d;

  function foo() public {
    
for(; d >= 0; --d){
if (dayAverageOutput[d] != 0) {
break;
}

}


  }

  

}

//#LOOPVARS: i


