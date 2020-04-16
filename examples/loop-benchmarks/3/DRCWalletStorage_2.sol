
pragma solidity ^0.5.10;



contract C {
  

  uint len;
mapping(address => DepositRepository) depositRepos;
address _deposit;
address _wallet;
bytes32 _newName;
uint i;

  function foo() public {
    
for(uint i = 1; i < len; i = (i) + (1)){
WithdrawWallet wallet = depositRepos[_deposit].withdrawWallets[i];
if (_wallet == wallet.walletAddr) {
wallet.name = _newName;
return true;
}

}


  }
}

//#LOOPVARS: i

contract WithdrawWallet { }

contract DepositRepository { }
