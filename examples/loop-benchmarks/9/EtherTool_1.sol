
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) userEtherOf;
uint256 _doneNum;
address[] _tos;
uint256[] _amounts;
uint i;

  function foo() public {
    
for(uint i = 0; i < _tos.length; i++){
bool done = false;
address to = _tos[i];
uint256 amount = _amounts[i];
if ((to != 0x0) && (amount > 0) && (userEtherOf[msg.sender] >= amount)) {
userEtherOf[msg.sender] = (userEtherOf[msg.sender]) - (amount);
to.transfer(amount);
_doneNum = (_doneNum) + (1);
done = true;
}

emit OnTransfer(msg.sender, to, done, amount, now, getEventId());
}


  }
}

//#LOOPVARS: i
