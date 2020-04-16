
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
address _to;
uint256 i;
mapping(address => ItemOption[]) toMapOption;
uint256 nowtime;

  function foo() public {
    
for(uint256 i = 0; i < toMapOption[_to].length; i++){
require(toMapOption[_to][i].releaseAmount >= 0);
if (nowtime >= toMapOption[_to][i].releaseTime && balances[_to] + toMapOption[_to][i].releaseAmount > balances[_to]) {
balances[_to] = (balances[_to]) + (toMapOption[_to][i].releaseAmount);
toMapOption[_to][i].releaseAmount = 0;
}

}


  }
}

//#LOOPVARS: i

contract ItemOption { }
