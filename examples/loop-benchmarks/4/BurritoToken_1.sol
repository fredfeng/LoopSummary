
pragma solidity ^0.5.10;



contract C {
  

  uint256[] burritos;
uint256 i;
uint256 poolTotal;
uint256 owed;
mapping(uint256 => Burrito) burritoData;

  function foo() public {
    
for(uint256 i = 0; i < burritos.length; i++){
uint256 totalBurritoOwed = poolTotal * burritoData[burritos[i]].payout / 10000;
uint256 burritoOwed = (totalBurritoOwed) - (burritoData[burritos[i]].withdrawn);
owed += burritoOwed;
burritoData[burritos[i]].withdrawn += burritoOwed;
}


  }
}

//#LOOPVARS: i

contract Burrito { }
