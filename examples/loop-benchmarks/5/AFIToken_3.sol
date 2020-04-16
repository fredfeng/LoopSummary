
pragma solidity ^0.5.10;



contract C {
  

  address[] whitelistArray;
uint256 INITIAL_SUPPLY;
uint256 i;
uint256 _totalRevenue;
mapping(address => uint256) snapshotBalance;
uint256 whitelistLength;
uint256 minRevenueToDeliver;
address contractAddress;

  function foo() public {
    
for(uint256 i = 0; i < whitelistLength; i++){
if (whitelistArray[i] == address(this)) {
continue;
}

uint256 amount = ((_totalRevenue) * (snapshotBalance[whitelistArray[i]])) / (INITIAL_SUPPLY);
if (amount > minRevenueToDeliver) {
bool done = contractAddress.call(bytes4(keccak256("transferRevenue(address,uint256)")), whitelistArray[i], amount);
require(done == true);
}

}


  }
}

//#LOOPVARS: i
