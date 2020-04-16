
pragma solidity ^0.5.10;



contract C {
  

  uint _userIdx;
bytes32 _groupName;
mapping(address => uint) memberAddress2index;
uint _groupMembersCount;
Group _group;
address[] _users;

  function foo() public {
    
for(uint _userIdx = 0; _userIdx < _users.length; ++_userIdx){
address _user = _users[_userIdx];
uint _memberIndex = memberAddress2index[_user];
require(_memberIndex != 0);
if (_group.memberAddress2index[_user] != 0) {
continue;
}

_groupMembersCount = (_groupMembersCount) + (1);
_group.memberAddress2index[_user] = _groupMembersCount;
_group.index2globalIndex[_groupMembersCount] = _memberIndex;
_addGroupToMember(_user, _groupName);
UserToGroupAdded(_user, _groupName);
}


  }
}

//#LOOPVARS: _userIdx

contract Group { }
