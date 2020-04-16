
pragma solidity ^0.5.10;



contract C {
  

  uint256 middleIndex;
uint256 resourceId;
uint256[] validResourceIds;
uint256 highIndex;
uint256 lowIndex;

  function foo() public {
    
while(resourceId != validResourceIds[middleIndex]){
require(lowIndex <= highIndex);
if (validResourceIds[middleIndex] < resourceId) {
lowIndex = (middleIndex) + (1);
} else {
highIndex = (middleIndex) - (1);
}

middleIndex = ((lowIndex) + (highIndex)) / (2);
}

  }
}

//#LOOPVARS: 
