
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) admins;
uint256 i;
address[] _userlist;
address[] adminaddress;

  function foo() public {
    
for(uint256 i = 0; i < _userlist.length; i++){
address baddr = _userlist[i];
if (baddr != address(0)) {
if (!admins[baddr]) {
admins[baddr] = true;
adminaddress.push(baddr) - 1;
}

}

}


  }
}

//#LOOPVARS: i
