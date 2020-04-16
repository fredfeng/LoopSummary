
pragma solidity ^0.5.10;



contract C {
  

  address[] _destAddrs;
uint256[] _values;
uint256 i;
ERC20 erc20tk;

  function foo() public {
    
for(i < _destAddrs.length; i = (i) + (1)){
if (!erc20tk.transfer(_destAddrs[i], _values[i])) {
break;
}

}


  }
}

//#LOOPVARS: i

contract ERC20 { }
