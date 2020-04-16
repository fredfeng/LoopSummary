
pragma solidity ^0.5.10;



contract C {
  

  address addr;
uint256 i;
uint256 numberOfBoosts;
uint256 _boostIdx;
mapping(uint256 => BoostData) boostData;

  function foo() public {
    
for(uint256 i = 0; i < numberOfBoosts; i++){
uint256 revert_i = numberOfBoosts - i - 1;
if (boostData[revert_i].owner == addr) {
_boostIdx = revert_i;
break;
}

}


  }
}

//#LOOPVARS: i

contract BoostData { }
