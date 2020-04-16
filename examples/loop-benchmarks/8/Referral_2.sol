
pragma solidity ^0.5.10;



contract C {
  

  address node;
uint _amount;
Data data;
uint8 _depositsCount;
uint prevPercentage;
mapping(uint8 => mapping(uint8 => uint)) feeDistribution;
uint ethUsdRate;

  function foo() public {
    
while(node != address(0)){
uint8 status = data.statuses(node);
uint nodePercentage = feeDistribution[status][_depositsCount];
uint percentage = (nodePercentage) - (prevPercentage);
data.addBalance(node, _amount * percentage * 10000);
data.addReferralDeposit(node, _amount * ethUsdRate / 10 ** 18);
updateStatus(node, status);
node = data.parentOf(node);
prevPercentage = nodePercentage;
}

  }
}

//#LOOPVARS: 

contract uint8 => mappinguint8 { }

contract Data { }
