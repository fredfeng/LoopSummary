






contract C {
  

  

  uint256 _number;
mapping(address => uint) balances;
uint totalplayers;
mapping(address => uint) total;
mapping(uint => address) playerA;
address owner;

  function foo() public {
    
for(uint256 s = 0; s < totalplayers; s = ((s) + (1))){
if (total[playerA[s]] == 0) {
continue;
}

balances[playerA[s]] = ((balances[playerA[s]]) + (((((_number) * (total[playerA[s]]))) / (balances[owner]))));
}


  }

  

}

//#LOOPVARS: s


