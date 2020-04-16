
pragma solidity ^0.5.10;



contract C {
  

  uint256 _gifAmount;
uint index;
address[] _users;
uint _result;

  function foo() public {
    
for(uint index = 0; index < _users.length; index++){
address _user = _users[index];
if (_sendWebGiftToken(_user, _gifAmount)) {
_result = (_result) + (1);
}

}


  }
}

//#LOOPVARS: index
