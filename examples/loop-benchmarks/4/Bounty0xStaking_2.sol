
pragma solidity ^0.5.10;



contract C {
  

  address[] _to;
address[] _from;
mapping(uint => mapping(address => uint)) stakes;
uint[] _submissionIds;
mapping(address => uint) balances;
uint[] _amounts;
uint i;

  function foo() public {
    
for(uint i = 0; i < _submissionIds.length; i++){
require(stakes[_submissionIds[i]][_from[i]] >= _amounts[i]);
stakes[_submissionIds[i]][_from[i]] = SafeMath.sub(stakes[_submissionIds[i]][_from[i]], _amounts[i]);
balances[_to[i]] = SafeMath.add(balances[_to[i]], _amounts[i]);
emit StakeReleased(_submissionIds[i], _from[i], _to[i], _amounts[i]);
}


  }
}

//#LOOPVARS: i

contract uint => mappingaddress { }
