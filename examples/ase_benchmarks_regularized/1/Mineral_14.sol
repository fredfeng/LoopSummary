






contract C {
  

  

  mapping(uint => uint) dayAverageOutput;

  function foo() public {
    
for(uint d; d >= 0; --d){
if (dayAverageOutput[d] != 0) {
break;
}

}


  }

  

}

//#LOOPVARS: d


