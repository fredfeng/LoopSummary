
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _betAmounts;
bool _result;
uint256 gameMinBetAmount;
uint256 gameMaxBetAmount;
uint[] _betNums;
uint i;

  function foo() public {
    
for(uint i = 0; i < _betNums.length && _result; i++){
uint _betNum = _betNums[i];
uint256 _betAmount = _betAmounts[i];
if (_betAmount < gameMinBetAmount) {
continue;
}

if (_betAmount > gameMaxBetAmount) {
_betAmount = gameMaxBetAmount;
}

if (_betNum > 0 && _betNum <= 2) {
_result = playBigOrSmall(_betNum, _betAmount);
} else if (_betNum == 3) {
_result = playAnyTriples(_betAmount);
} else if (_betNum <= 9) {
_result = playSpecificTriples((_betNum) - (3), _betAmount);
} else if (_betNum <= 15) {
_result = playSpecificDoubles((_betNum) - (9), _betAmount);
} else if (_betNum <= 29) {
_result = playThreeDiceTotal((_betNum) - (12), _betAmount);
} else if (_betNum <= 44) {
if (_betNum <= 34) {
uint _betMinNum = 1;
uint _betMaxNum = (_betNum) - (28);
} else if (_betNum <= 38) {
_betMinNum = 2;
_betMaxNum = (_betNum) - (32);
} else if (_betNum <= 41) {
_betMinNum = 3;
_betMaxNum = (_betNum) - (35);
} else if (_betNum <= 43) {
_betMinNum = 4;
_betMaxNum = (_betNum) - (37);
} else {
_betMinNum = 5;
_betMaxNum = 6;
}




_result = playDiceCombinations(_betMinNum, _betMaxNum, _betAmount);
} else if (_betNum <= 50) {
_result = playSingleDiceBet((_betNum) - (44), _betAmount);
}







}


  }
}

//#LOOPVARS: i
