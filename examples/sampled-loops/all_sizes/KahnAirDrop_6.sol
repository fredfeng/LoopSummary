
pragma solidity ^0.5.10;



contract C {
  

  address[] _addlist;
mapping(address => User) bounties;
mapping(address => bool) blacklist;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _addlist.length; i++){
address baddr = _addlist[i];
if (baddr != address(0) && !bounties[baddr].blacklisted) {
bounties[baddr].blacklisted = true;
blacklist[baddr] = true;
}

}


  }
}

//#LOOPVARS: i

contract User { }
