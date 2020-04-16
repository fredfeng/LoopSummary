
pragma solidity ^0.5.10;



contract C {
  

  uint _amount;
mapping(uint8 => mapping(uint16 => uint256)) feeDistribution;
Data data;
uint8 _depositsCount;
uint prevPercentage;
address node;
uint ethUsdRate;

  function foo() public {
    
while(node != address(0)){
uint8 status = data.statuses(node);
uint nodePercentage = feeDistribution[status][_depositsCount];
uint percentage = (nodePercentage) - (prevPercentage);
data.addBalance(node, _amount * percentage * 1000);
data.addReferralDeposit(node, _amount * ethUsdRate / 10 ** 18);
updateStatus(node, status);
node = data.parentOf(node);
prevPercentage = nodePercentage;
}

  }
}

//#LOOPVARS: 

contract uint8 => mappinguint16 { }

contract Data { }
