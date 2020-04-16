
pragma solidity ^0.5.10;



contract C {
  

  address _from;
uint256 earlier;
mapping(address => uint256[]) lockTime;
mapping(address => uint256) lockNum;
uint256[] _time;
address _to;
mapping(address => mapping(address => uint256)) allowed;
uint256 i;
mapping(address => uint256[]) lockValue;
uint256 later;
mapping(address => uint256) balanceP;
uint256[] _value;

  function foo() public {
    
while(i < _time.length){
if (_value[i] > 0) {
balanceP[_from] = (balanceP[_from]) - (_value[i]);
allowed[_from][msg.sender] = (allowed[_from][msg.sender]) - (_value[i]);
lockTime[_to].length = lockNum[_to] + 1;
lockValue[_to].length = lockNum[_to] + 1;
lockTime[_to][lockNum[_to]] = (((now) + (_time[i])) + (earlier)) - (later);
lockValue[_to][lockNum[_to]] = _value[i];
lockNum[_to]++;
}

emit TransferLocked(_from, _to, _time[i], _value[i]);
emit Transfer(_from, _to, _value[i]);
i++;
}

  }
}

//#LOOPVARS: 

contract address => mappingaddress { }
