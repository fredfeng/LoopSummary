
pragma solidity ^0.5.10;



contract C {
  

  bool hasFound;
uint256 target;
uint256 index;
uint256 i;
uint256[] array;
uint256 cumulativeTotal;

  function foo() public {
    
for(uint256 i = 0; i < array.length; i++){
cumulativeTotal += array[i];
if (cumulativeTotal > target) {
hasFound = true;
index = i;
break;
}

}


  }
}

//#LOOPVARS: i
