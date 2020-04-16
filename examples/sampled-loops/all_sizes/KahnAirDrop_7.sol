
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => User) bounties;
mapping(address => bool) blacklist;
uint256 i;
address[] _userlist;

  function foo() public {
    
for(uint256 i = 0; i < _userlist.length; i++){
address baddr = _userlist[i];
if (baddr != address(0) && bounties[baddr].blacklisted) {
bounties[baddr].blacklisted = false;
blacklist[baddr] = false;
}

}


  }
}

//#LOOPVARS: i

contract User { }
