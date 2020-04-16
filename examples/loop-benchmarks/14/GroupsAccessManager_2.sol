
pragma solidity ^0.5.10;



contract C {
  

  uint _userIdx;
mapping(uint => address) index2memberAddress;
bytes32 _groupName;
mapping(address => uint) memberAddress2index;
uint _groupMembersCount;
Group _group;
address[] _users;

  function foo() public {
    
for(uint _userIdx = 0; _userIdx < _users.length; ++_userIdx){
address _user = _users[_userIdx];
uint _memberIndex = memberAddress2index[_user];
uint _groupMemberIndex = _group.memberAddress2index[_user];
if (_memberIndex == 0 || _groupMemberIndex == 0) {
continue;
}

if (_groupMemberIndex != _groupMembersCount) {
uint _lastUserGlobalIndex = _group.index2globalIndex[_groupMembersCount];
address _lastUser = index2memberAddress[_lastUserGlobalIndex];
_group.index2globalIndex[_groupMemberIndex] = _lastUserGlobalIndex;
_group.memberAddress2index[_lastUser] = _groupMemberIndex;
}

delete _group.memberAddress2index[_user];
delete _group.index2globalIndex[_groupMembersCount];
_groupMembersCount = (_groupMembersCount) - (1);
_removeGroupFromMember(_user, _groupName);
UserFromGroupRemoved(_user, _groupName);
}


  }
}

//#LOOPVARS: _userIdx

contract Group { }
