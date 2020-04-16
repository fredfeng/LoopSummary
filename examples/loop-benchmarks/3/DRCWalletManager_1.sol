
pragma solidity ^0.5.10;



contract C {
  

  address[] wallets;
mapping(address => DepositRepository) depositRepos;
address _deposit;
bytes32[] names;
uint i;
uint[] _indices;

  function foo() public {
    
for(uint i = 0; i < _indices.length; i = (i) + (1)){
WithdrawWallet wallet = depositRepos[_deposit].withdrawWallets[_indices[i]];
names[i] = wallet.name;
wallets[i] = wallet.walletAddr;
}


  }
}

//#LOOPVARS: i

contract WithdrawWallet { }

contract DepositRepository { }
