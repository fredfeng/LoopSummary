






contract C {
  

  

  mapping(address => bool) admins;
address[] _userlist;

  function foo() public {
    
for(uint256 i = 0; i < _userlist.length; i++){
address baddr = _userlist[i];
if (baddr != address(0)) {
if (admins[baddr]) {
admins[baddr] = false;
}

}

}


  }

  

}

//#LOOPVARS: i


