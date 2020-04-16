
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => User) bounties;
mapping(address => bool) signups;
uint256 i;
uint userSignupCount;
address[] _userlist;

  function foo() public {
    
for(uint256 i = 0; i < _userlist.length; i++){
address baddr = _userlist[i];
if (baddr != address(0) && bounties[baddr].user_address == baddr) {
bounties[baddr].status = false;
signups[baddr] = false;
userSignupCount--;
}

}


  }
}

//#LOOPVARS: i

contract User { }
