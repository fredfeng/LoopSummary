






contract C {
  

  

  address[] _mem;
uint whitelistTokens;
mapping(address => uint) whitemap;
uint[] _tokens;

  function foo() public {
    
for(uint i = 0; i < _mem.length; i++){
whitelistTokens = ((((whitelistTokens) - (whitemap[_mem[i]]))) + (_tokens[i]));
whitemap[_mem[i]] = _tokens[i];
}


  }

  

}

//#LOOPVARS: i


