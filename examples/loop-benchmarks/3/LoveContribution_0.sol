
pragma solidity ^0.5.10;



contract C {
  

  bool flag;
address[] topWinners;
uint256 i;
mapping(address => uint256) contributionOf;

  function foo() public {
    
for(uint256 i = 0; i < 10; i++){
if (topWinners[i] == msg.sender) {
break;
}

if (contributionOf[msg.sender] > contributionOf[topWinners[i]]) {
flag = true;
break;
}

}


  }
}

//#LOOPVARS: i
