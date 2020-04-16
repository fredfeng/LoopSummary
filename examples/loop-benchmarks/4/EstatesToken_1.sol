
pragma solidity ^0.5.10;



contract C {
  

  uint256[] estates;
mapping(uint256 => Estate) estateData;
uint256 i;
uint256 poolTotal;
uint256 owed;

  function foo() public {
    
for(uint256 i = 0; i < estates.length; i++){
uint256 totalEstateOwed = poolTotal * estateData[estates[i]].payout / 10000;
uint256 estateOwed = (totalEstateOwed) - (estateData[estates[i]].withdrawn);
owed += estateOwed;
estateData[estates[i]].withdrawn += estateOwed;
}


  }
}

//#LOOPVARS: i

contract Estate { }
