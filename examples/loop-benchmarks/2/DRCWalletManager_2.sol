
pragma solidity ^0.5.10;



contract C {
  

  uint len;
mapping(address => DepositRepository) depositRepos;
address _deposit;
address _to;
bytes32 _name;
uint i;

  function foo() public {
    
for(uint i = 0; i < len; i = (i) + (1)){
WithdrawWallet wallet = depositRepos[_deposit].withdrawWallets[i];
if (_name == wallet.name) {
return (true, (_to == wallet.walletAddr));
}

}


  }
}

//#LOOPVARS: i

contract WithdrawWallet { }

contract DepositRepository { }
