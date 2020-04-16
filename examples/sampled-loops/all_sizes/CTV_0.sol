
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalSupply;
uint256 totalWeiReceived;
mapping(address => uint256) balances;
uint batchSize;
uint256 countInvestorsRefunded;
mapping(uint256 => address) investorList;
mapping(address => Investor) investors;
uint i;

  function foo() public {
    
for(uint i = countInvestorsRefunded.Add(1); i <= batchSize; i++){
address investorAddress = investorList[i];
Investor investorStruct = investors[investorAddress];
if (investorStruct.tokensPurchased > 0 && investorStruct.tokensPurchased <= balances[investorAddress]) {
investorAddress.transfer(investorStruct.weiReceived);
totalWeiReceived = totalWeiReceived.Sub(investorStruct.weiReceived);
totalSupply = totalSupply.Sub(investorStruct.tokensPurchased);
balances[investorAddress] = balances[investorAddress].Sub(investorStruct.tokensPurchased);
investorStruct.weiReceived = 0;
investorStruct.tokensPurchased = 0;
investorStruct.refunded = true;
}

}


  }
}

//#LOOPVARS: i

contract Investor { }
