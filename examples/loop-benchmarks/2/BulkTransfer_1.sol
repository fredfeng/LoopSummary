
pragma solidity ^0.5.10;



contract C {
  

  uint[] _amounts;
address[] _addresses;
uint i;
ERC20 _token;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
_safeERC20Transfer(_token, _addresses[i], _amounts[i]);
emit MultiERC20Transfer(msg.sender, _addresses[i], _amounts[i], _token);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }
