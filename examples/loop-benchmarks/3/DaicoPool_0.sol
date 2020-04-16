
pragma solidity ^0.5.10;



contract C {
  

  uint256 pid;
address account;
mapping(uint256 => mapping(address => uint256)) deposits;
Proposal[] proposals;
uint256 amount;

  function foo() public {
    
for(uint256 pid = 0; pid < proposals.length; pid++){
if (!proposals[pid].isFinalized) {
break;
}

amount = (amount) + (deposits[pid][account]);
deposits[pid][account] = 0;
}


  }
}

//#LOOPVARS: pid

contract Proposal { }

contract uint256 => mappingaddress { }
