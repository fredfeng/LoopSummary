
pragma solidity ^0.5.10;



contract C {
  

  address[] proxyAddresses;
address _target;
uint256 i;
uint256 _count;
bytes _data;

  function foo() public {
    
for(uint256 i = 0; i < _count; ++i){
proxyAddresses[i] = createProxyImpl(_target, _data);
}


  }
}

//#LOOPVARS: i
