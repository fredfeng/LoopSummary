
pragma solidity ^0.5.10;



contract C {
  

  uint _groupIdx;
bytes32[] _groups;
mapping(uint => bytes32) index2groupName;
uint _groupsCount;

  function foo() public {
    
for(uint _groupIdx = 0; _groupIdx < _groupsCount; ++_groupIdx){
_groups[_groupIdx] = index2groupName[_groupIdx + 1];
}


  }
}

//#LOOPVARS: _groupIdx
