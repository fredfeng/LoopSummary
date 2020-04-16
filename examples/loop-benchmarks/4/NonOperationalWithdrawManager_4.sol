
pragma solidity ^0.5.10;



contract C {
  

  bytes32[] _groupNames;
uint[] _declineLimits;
uint _policyGroupsCount;
uint _idx;
uint[] _acceptLimits;
Policy _policy;

  function foo() public {
    
for(uint _idx = 0; _idx < _policyGroupsCount; ++_idx){
Requirements _requirements = _policy.participatedGroups[_idx + 1];
_groupNames[_idx] = _requirements.groupName;
_acceptLimits[_idx] = _requirements.acceptLimit;
_declineLimits[_idx] = _requirements.declineLimit;
}


  }
}

//#LOOPVARS: _idx

contract Requirements { }

contract Policy { }
