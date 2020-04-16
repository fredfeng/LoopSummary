
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint => mapping(address => uint)) stakes;
uint[] _submissionIds;
uint i;
uint[] _amounts;

  function foo() public {
    
for(uint i = 0; i < _submissionIds.length; i++){
stakes[_submissionIds[i]][msg.sender] = SafeMath.add(stakes[_submissionIds[i]][msg.sender], _amounts[i]);
emit Stake(_submissionIds[i], msg.sender, _amounts[i]);
}


  }
}

//#LOOPVARS: i

contract uint => mappingaddress { }
