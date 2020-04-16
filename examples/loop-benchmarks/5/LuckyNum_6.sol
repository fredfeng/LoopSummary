
pragma solidity ^0.5.10;



contract C {
  

  uint256 l;
bytes name;
uint256 seed;
uint256 lID;

  function foo() public {
    
for(uint256 l = 10; l > 0; l--){
if (lID > 0) {
name[l - 1] = (byte(lID % 10 + 0x30));
lID /= 10;
} else {
name[l - 1] = (byte(seed % 26 + 0x41));
seed /= 100;
}

}


  }
}

//#LOOPVARS: l
