
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) oracles;
uint _idx;
address[] _whitelist;

  function foo() public {
    
for(uint _idx = 0; _idx < _whitelist.length; ++_idx){
address _oracle = _whitelist[_idx];
if (!oracles[_oracle]) {
oracles[_oracle] = true;
_emitOracleAdded(_oracle);
}

}


  }
}

//#LOOPVARS: _idx
