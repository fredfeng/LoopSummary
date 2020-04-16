
pragma solidity ^0.5.10;



contract C {
  

  address[] _investors;
mapping(address => Investor) investors;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _investors.length; i++){
if (_investors[i] != address(0) && investors[_investors[i]].status != InvestorStatus.WHITELISTED) {
investors[_investors[i]].status = InvestorStatus.WHITELISTED;
emit InvestorWhitelisted(_investors[i], now, msg.sender);
}

}


  }
}

//#LOOPVARS: i

contract Investor { }
