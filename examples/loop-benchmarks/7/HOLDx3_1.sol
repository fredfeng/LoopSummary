
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint) invest_count;
mapping(address => uint) last_withdraw_time;
mapping(address => uint[]) invest_time;
mapping(address => uint[]) invest_amount;
uint time_spent;
uint stepTime;
uint percent;
uint _payout_amount;
uint16 i;

  function foo() public {
    
for(uint16 i = 0; i < invest_count[msg.sender]; i++){
if (last_withdraw_time[msg.sender] > invest_time[msg.sender][i]) {
time_spent = (((now) - (last_withdraw_time[msg.sender]))) / (stepTime);
} else {
time_spent = (((now) - (invest_time[msg.sender][i]))) / (stepTime);
}

if (time_spent > 30) time_spent = 30;

uint current_payout_amount = (((invest_amount[msg.sender][i]) * (time_spent)) * (percent)) / (100);
_payout_amount = (_payout_amount) + (current_payout_amount);
}


  }
}

//#LOOPVARS: i
