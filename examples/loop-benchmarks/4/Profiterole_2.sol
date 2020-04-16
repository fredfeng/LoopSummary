
pragma solidity ^0.5.10;



contract C {
  

  address[] _blacklist;
uint _idx;
mapping(address => bool) oracles;

  function foo() public {
    
for(uint _idx = 0; _idx < _blacklist.length; ++_idx){
address _oracle = _blacklist[_idx];
if (oracles[_oracle]) {
delete oracles[_oracle];
_emitOracleRemoved(_oracle);
}

}


  }
}

//#LOOPVARS: _idx
