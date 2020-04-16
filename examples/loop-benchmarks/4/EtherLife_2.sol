
pragma solidity ^0.5.10;



contract C {
  

  address to;
mapping(address => deposit[]) deposits;
uint i;
uint sum;

  function foo() public {
    
for(uint i = 0; i < deposits[to].length; i++){
uint value = calculateWithdraw(now, deposits[to][i].time, deposits[to][i].value, deposits[to][i].timeOfLastWithdraw);
if (value > 0) {
deposits[to][i].timeOfLastWithdraw = calculateNewTime(deposits[to][i].timeOfLastWithdraw, now);
}

sum = (sum) + (value);
}


  }
}

//#LOOPVARS: i

contract deposit { }
