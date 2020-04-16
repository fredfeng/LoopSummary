
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) userEtherOf;
uint256 _amount;
uint256 _doneNum;
address[] _tos;
uint i;

  function foo() public {
    
for(uint i = 0; i < _tos.length; i++){
bool done = false;
address to = _tos[i];
if (to != 0x0 && userEtherOf[msg.sender] >= _amount) {
userEtherOf[msg.sender] = (userEtherOf[msg.sender]) - (_amount);
to.transfer(_amount);
_doneNum = (_doneNum) + (1);
done = true;
}

emit OnTransfer(msg.sender, to, done, _amount, now, getEventId());
}


  }
}

//#LOOPVARS: i
