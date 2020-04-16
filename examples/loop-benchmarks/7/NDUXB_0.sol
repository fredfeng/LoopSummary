
pragma solidity ^0.5.10;



contract C {
  

  Tx[] usertxs;
uint amount;
Tx curtx;

  function foo() public {
    
for(Tx curtx = usertxs[usertxs.length - 1]; usertxs.length != 0; ){
if (curtx.amount > amount) {
curtx.amount -= amount;
amount = 0;
} else {
amount -= curtx.amount;
delete usertxs[usertxs.length - 1];
--usertxs.length;
}

if (amount == 0) break;

}


  }
}

//#LOOPVARS: curtx

contract Tx { }
