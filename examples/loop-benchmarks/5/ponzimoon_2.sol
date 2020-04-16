
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => address) pidXAddress;
uint i;
Spaceship[] spaceships;

  function foo() public {
    
for(uint i = 0; i < spaceships.length; i++){
Spaceship _s = spaceships[i];
_s.captain = pidXAddress[1];
_s.ticketCount = 0;
_s.spaceshipPrice = 15 ether;
_s.speed = 100000;
}


  }
}

//#LOOPVARS: i

contract Spaceship { }
