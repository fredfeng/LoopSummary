
pragma solidity ^0.5.10;



contract C {
  

  uint256 ICO_TOKENS_CAP;
HardcapToken token;
uint256 _currentSupply;
uint256 _tokenAmount;
uint256 _leftowers;
uint256 _tokens;
mapping(uint256 => Phase) phases;
Phase _phase;
bool _phaseChanged;
uint256 phase;

  function foo() public {
    
while(_tokenAmount > 0 && _currentSupply < ICO_TOKENS_CAP){
_leftowers = (_phase.capTo) - (_currentSupply);
if (_leftowers < _tokenAmount) {
_tokens = (_tokens) + (_leftowers);
_tokenAmount = (_tokenAmount) - (_leftowers);
phase = phase + 1;
_phaseChanged = true;
} else {
_tokens = (_tokens) + (_tokenAmount);
_tokenAmount = 0;
}

_currentSupply = (token.totalSupply()) + (_tokens);
_phase = phases[phase];
}

  }
}

//#LOOPVARS: 

contract HardcapToken { }

contract Phase { }
