






contract C {
  

  

  mapping(address => bool) staffs;
address[] _userlist;

  function foo() public {
    
for(uint256 i = 0; i < _userlist.length; i++){
address baddr = _userlist[i];
if (baddr != address(0)) {
if (staffs[baddr]) {
staffs[baddr] = false;
}

}

}


  }

  

}

//#LOOPVARS: i


