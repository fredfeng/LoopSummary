
pragma solidity ^0.5.10;



contract C {
  

  address _from;
TokenStorage self;
uint _amount;
address _to;
address[] from_swaps;
uint i;

  function foo() public {
    
for(uint i = (from_swaps.length) - (1); i > 0; i--){
uint from_swap_user_index = self.swap_balances_index[from_swaps[i]][_from];
Balance from_user_bal = self.swap_balances[from_swaps[i]][from_swap_user_index];
if (_amount >= from_user_bal.amount) {
_amount -= from_user_bal.amount;
self.user_swaps[_from].length = (self.user_swaps[_from].length) - (1);
delete self.user_swaps_index[_from][from_swaps[i]];
if (self.user_swaps_index[_to][from_swaps[i]] != 0) {
uint to_balance_index = self.swap_balances_index[from_swaps[i]][_to];
assert(to_balance_index != 0);
self.swap_balances[from_swaps[i]][to_balance_index].amount = (self.swap_balances[from_swaps[i]][to_balance_index].amount) + (from_user_bal.amount);
removeFromSwapBalances(self, _from, from_swaps[i]);
} else {
if (self.user_swaps[_to].length == 0) {
self.user_swaps[_to].push(address(0x0));
}

self.user_swaps_index[_to][from_swaps[i]] = self.user_swaps[_to].length;
self.user_swaps[_to].push(from_swaps[i]);
self.swap_balances[from_swaps[i]][from_swap_user_index].owner = _to;
self.swap_balances_index[from_swaps[i]][_to] = self.swap_balances_index[from_swaps[i]][_from];
delete self.swap_balances_index[from_swaps[i]][_from];
}

if (_amount == 0) break;

} else {
uint to_swap_balance_index = self.swap_balances_index[from_swaps[i]][_to];
if (self.user_swaps_index[_to][from_swaps[i]] != 0) {
self.swap_balances[from_swaps[i]][to_swap_balance_index].amount = (self.swap_balances[from_swaps[i]][to_swap_balance_index].amount) + (_amount);
} else {
if (self.user_swaps[_to].length == 0) {
self.user_swaps[_to].push(address(0x0));
}

self.user_swaps_index[_to][from_swaps[i]] = self.user_swaps[_to].length;
self.user_swaps[_to].push(from_swaps[i]);
self.swap_balances_index[from_swaps[i]][_to] = self.swap_balances[from_swaps[i]].length;
self.swap_balances[from_swaps[i]].push(Balance(_to, _amount));
}

self.swap_balances[from_swaps[i]][from_swap_user_index].amount = (self.swap_balances[from_swaps[i]][from_swap_user_index].amount) - (_amount);
break;
}

}


  }
}

//#LOOPVARS: i

contract Balance { }

contract TokenStorage { }
