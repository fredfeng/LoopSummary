
pragma solidity ^0.5.10;



contract C {
  

  address _from;
ERC20 erc20tk;
uint256 i;
uint256[] _values;
address[] _destAddrs;

  function foo() public {
    
for(i < _destAddrs.length; i = (i) + (1)){
if (!erc20tk.transferFrom(_from, _destAddrs[i], _values[i])) {
break;
}

}


  }
}

//#LOOPVARS: i

contract ERC20 { }
