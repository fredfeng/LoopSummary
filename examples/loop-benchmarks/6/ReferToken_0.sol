
pragma solidity ^0.5.10;



contract C {
  

  uint level;
address currentReferral;
uint256 refValue;
mapping(address => uint) statuses;
uint256 _amount;
mapping(address => address) referTree;
uint depth;
mapping(uint => mapping(string => uint[])) statusRewardsMap;
uint currentStatus;
string _key;

  function foo() public {
    
for(uint level = 0; level < depth; ++level){
currentReferral = referTree[currentReferral];
if (currentReferral == 0x0) {
break;
}

currentStatus = statuses[currentReferral];
if (currentStatus < 3 && level >= 3) {
continue;
}

refValue = ((_amount) * (statusRewardsMap[currentStatus][_key][level])) / (100);
rewardMint(currentReferral, refValue);
}


  }
}

//#LOOPVARS: level

contract string { }

contract uint => mappingstring { }
