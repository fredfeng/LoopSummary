






contract C {
  

  

  uint32 d;
  uint32 start;
mapping(uint32 => uint) dayAverageOutput;
uint32 writeCount;
uint ao;

  function foo() public {
    
for(uint32 d = d + 1; d <= start / 24; ++d){
ao = ao * 9996 / 10000;
if ((start / 24 - d) < writeCount) {
dayAverageOutput[d] = ao;
}

}


  }

  

}

//#LOOPVARS: d


