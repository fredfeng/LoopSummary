
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256 totalSupply;
address[] _recipient;
mapping(address => Account) accounts;
uint256[] _value;

  function foo() public {
    
for(uint8 i = 0; i < _recipient.length; i++){
address tmpRecipient = _recipient[i];
uint tmpValue = _value[i];
Account account = accounts[tmpRecipient];
account.valueMod = (account.valueMod) + (tmpValue);
account.lastAirdropClaimTime = now;
totalSupply = (totalSupply) + (tmpValue);
Transfer(msg.sender, tmpRecipient, tmpValue);
}


  }
}

//#LOOPVARS: i

contract Account { }
