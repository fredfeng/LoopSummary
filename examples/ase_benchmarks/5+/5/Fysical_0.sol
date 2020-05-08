






contract C {
  

  

  uint256 middleIndex;
uint256 lowIndex;
uint256 highIndex;
uint256[] validResourceIds;
uint256 resourceId;

  function foo() public {
    
while(resourceId != validResourceIds[middleIndex]){
require(lowIndex <= highIndex);
if (validResourceIds[middleIndex] < resourceId) {
lowIndex = ((middleIndex) + (1));
} else {
highIndex = ((middleIndex) - (1));
}

middleIndex = ((((lowIndex) + (highIndex))) / (2));
}

  }

  

}

//#LOOPVARS: i


