
pragma solidity ^0.5.10;



contract C {
  

  address _owner;
StakeStruct[] arrayStakesToken;
mapping(address => TransferInStructToken[]) transferInsToken;
uint i;
mapping(address => uint256) balancesToken;

  function foo() public {
    
for(uint i = 0; i < transferInsToken[_owner].length; i++){
if (transferInsToken[_owner][i].isRipe == true) {
balancesToken[_owner] = (balancesToken[_owner]) - (arrayStakesToken[transferInsToken[_owner][i].indexStake].amount);
removeMemberArrayToken(_owner, i);
return false;
}

}


  }
}

//#LOOPVARS: i

contract TransferInStructToken { }

contract StakeStruct { }
