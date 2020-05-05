






contract C {
  

  

  mapping(uint32 => uint) dayAverageOutput;
uint32 d;

  function foo() public {
    
for(uint d; d >= 0; --d){
if (dayAverageOutput[d] != 0) {
break;
}

}


  }

  

}

//#LOOPVARS: d


