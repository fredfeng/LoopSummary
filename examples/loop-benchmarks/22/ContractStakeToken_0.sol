
pragma solidity ^0.5.10;



contract C {
  

  uint256 _now;
address _address;
StakeStruct[] arrayStakesToken;
mapping(address => TransferInStructToken[]) transferInsToken;
uint256 amount;
uint i;

  function foo() public {
    
for(uint i = 0; i < transferInsToken[_address].length; i++){
uint256 indexCurStake = transferInsToken[_address][i].indexStake;
TypeStake stake = arrayStakesToken[indexCurStake].stakeType;
uint256 stakeTime = arrayStakesToken[indexCurStake].time;
uint256 stakeAmount = arrayStakesToken[indexCurStake].amount;
uint8 currentStake = 0;
if (arrayStakesToken[transferInsToken[_address][i].indexStake].status == StatusStake.CANCEL) {
amount = (amount) + (stakeAmount);
transferInsToken[_address][i].isRipe = true;
continue;
}

if (stake == TypeStake.DAY) {
currentStake = 0;
if (_now < (stakeTime) + (1 days)) continue;

}

if (stake == TypeStake.WEEK) {
currentStake = 1;
if (_now < (stakeTime) + (7 days)) continue;

}

if (stake == TypeStake.MONTH) {
currentStake = 2;
if (_now < (stakeTime) + (730 hours)) continue;

}

uint256 amountHours = ((_now) - (stakeTime)) / (1 hours);
stakeAmount = calculator(currentStake, stakeAmount, amountHours);
amount = (amount) + (stakeAmount);
transferInsToken[_address][i].isRipe = true;
arrayStakesToken[transferInsToken[_address][i].indexStake].status = StatusStake.COMPLETED;
}


  }
}

//#LOOPVARS: i

contract TransferInStructToken { }

contract TypeStake { }

contract StakeStruct { }
