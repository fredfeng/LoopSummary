
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint32 => uint) dayAverageOutput;
uint32 d;
uint32 writeCount;
uint32 start;
uint ao;

  function foo() public {
    
for(d = d + 1; d <= start / 24; ++d){
ao = ao * 9996 / 10000;
if ((start / 24 - d) < writeCount) {
dayAverageOutput[d] = ao;
}

}


  }
}

//#LOOPVARS: d
