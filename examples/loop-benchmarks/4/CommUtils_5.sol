
pragma solidity ^0.5.10;



contract C {
  

  uint256 digits;
uint256[] idxs;
uint256 i;
uint256[] ans;
uint256 base;

  function foo() public {
    
for(uint256 i = 0; i < digits; i++){
uint256 idx = random(idxs.length, i + base);
uint256 wordIdx = idxs[idx];
ans[i] = wordIdx;
idxs = idxs.removeByIdx(idx);
}


  }
}

//#LOOPVARS: i
