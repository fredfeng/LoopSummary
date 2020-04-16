
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => Collateralization[]) collateralizations;
uint256 reclaimableAmount;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < collateralizations[msg.sender].length; i++){
if (collateralizations[msg.sender][i].claimed) {
continue;
} else if (collateralizations[msg.sender][i].releaseDate > now) {
break;
}


reclaimableAmount = (reclaimableAmount) + (collateralizations[msg.sender][i].value);
collateralizations[msg.sender][i].claimed = true;
}


  }
}

//#LOOPVARS: i

contract Collateralization { }
