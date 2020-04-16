
pragma solidity ^0.5.10;



contract C {
  

  address[] staffaddress;
mapping(address => bool) staffs;
uint256 i;
address[] _userlist;

  function foo() public {
    
for(uint256 i = 0; i < _userlist.length; i++){
address baddr = _userlist[i];
if (baddr != address(0)) {
if (!staffs[baddr]) {
staffs[baddr] = true;
staffaddress.push(baddr) - 1;
}

}

}


  }
}

//#LOOPVARS: i
