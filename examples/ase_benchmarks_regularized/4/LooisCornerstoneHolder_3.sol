






contract C {
  

  

  address[] investors;
uint256 restSupply;
mapping(address => uint256) investorAmount;
address _investor;

  function foo() public {
    
for(uint i = 0; i < investors.length; i++){
if (investors[i] == _investor) {
investors[i] = investors[investors.length - 1];
restSupply = ((restSupply) + (investorAmount[_investor]));
investorAmount[_investor] = 0;
break;
}

}


  }

  

}

//#LOOPVARS: i


