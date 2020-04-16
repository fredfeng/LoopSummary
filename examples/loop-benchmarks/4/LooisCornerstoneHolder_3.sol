
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) investorAmount;
address[] investors;
address _investor;
uint256 restSupply;
uint i;

  function foo() public {
    
for(uint i = 0; i < investors.length; i++){
if (investors[i] == _investor) {
investors[i] = investors[investors.length - 1];
restSupply = (restSupply) + (investorAmount[_investor]);
investorAmount[_investor] = 0;
break;
}

}


  }
}

//#LOOPVARS: i
