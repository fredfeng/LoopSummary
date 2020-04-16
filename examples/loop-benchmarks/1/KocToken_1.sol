
pragma solidity ^0.5.10;



contract C {
  

  address _owner;
uint256 sum;
mapping(address => Vesting[]) vestings;
uint i;

  function foo() public {
    
for(uint i = 0; i < vestings[_owner].length; i++){
sum = (sum) + ((vestings[_owner][i].amount) - (vestings[_owner][i].withdrawed));
}


  }
}

//#LOOPVARS: i

contract Vesting { }
