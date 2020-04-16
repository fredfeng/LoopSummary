
pragma solidity ^0.5.10;



contract C {
  

  uint256 ICO_TOKENS_CAP;
HardcapToken token;
uint256 _currentSupply;
uint256 _weiSpent;
uint256 _weiAmount;
uint256 _leftowers;
uint256 _tokens;
mapping(uint256 => Phase) phases;
Phase _phase;
uint256 _weiReq;
bool _phaseChanged;
uint256 phase;

  function foo() public {
    
while(_weiAmount > 0 && _currentSupply < ICO_TOKENS_CAP){
_leftowers = (_phase.capTo) - (_currentSupply);
_weiReq = (_leftowers) / (_phase.rate);
if (_weiReq < _weiAmount) {
_tokens = (_tokens) + (_leftowers);
_weiAmount = (_weiAmount) - (_weiReq);
_weiSpent = (_weiSpent) + (_weiReq);
phase = phase + 1;
_phaseChanged = true;
} else {
_tokens = (_tokens) + ((_weiAmount) * (_phase.rate));
_weiSpent = (_weiSpent) + (_weiAmount);
_weiAmount = 0;
}

_currentSupply = (token.totalSupply()) + (_tokens);
_phase = phases[phase];
}

  }
}

//#LOOPVARS: 

contract HardcapToken { }

contract Phase { }
