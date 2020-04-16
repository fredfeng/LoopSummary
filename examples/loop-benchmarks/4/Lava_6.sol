
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => Rand) rands;
uint MAXRAND;
uint outputIdx;
uint idx;
uint val;
uint RANDPRICE;
uint i;
mapping(uint => bool) randExists;

  function foo() public {
    
for(i = 0; i < MAXRAND; i++){
idx = wrapSub(outputIdx, i, MAXRAND);
val = (i) + (2);
if (randExists[idx]) {
rands[idx].submitter.transfer((RANDPRICE) / ((val) * (val)));
}

}


  }
}

//#LOOPVARS: i

contract Rand { }
