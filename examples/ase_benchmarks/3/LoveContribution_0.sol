






contract C {
  

  

  bool flag;
mapping(address => uint256) contributionOf;
address[] topWinners;

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


