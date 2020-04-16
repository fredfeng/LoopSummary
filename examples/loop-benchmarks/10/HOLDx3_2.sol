
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint) invest_count;
mapping(address => uint) last_withdraw_time;
mapping(address => uint[]) invest_time;
mapping(address => uint[]) invest_amount;
uint time_spent;
uint stepTime;
uint16 i;
uint hold_payout_amount;

  function foo() public {
    
for(uint16 i = 0; i < invest_count[msg.sender]; i++){
if (last_withdraw_time[msg.sender] > invest_time[msg.sender][i]) time_spent = (((now) - (last_withdraw_time[msg.sender]))) / ((stepTime) * (24)); else time_spent = (((now) - (invest_time[msg.sender][i]))) / ((stepTime) * (24));

if (time_spent > 30) time_spent = 30;

if (time_spent > 0) {
uint hold_percent = 117 ** time_spent;
uint devider = 100 ** time_spent;
uint current_payout_amount = (((invest_amount[msg.sender][i]) * (hold_percent)) / (devider)) / (100);
hold_payout_amount = (hold_payout_amount) + (current_payout_amount);
}

}


  }
}

//#LOOPVARS: i
