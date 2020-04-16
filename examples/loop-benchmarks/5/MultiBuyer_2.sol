
pragma solidity ^0.5.10;



contract C {
  

  uint256 bestAmount;
IMultiToken _mtkn;
uint i;
uint j;

  function foo() public {
    
for(i = _mtkn.tokensCount(); i > 0; i--){
ERC20 token = _mtkn.tokens(i - 1);
token.approve(_mtkn, token.balanceOf(this));
uint256 amount = ((j) * (token.balanceOf(this))) / (token.balanceOf(_mtkn));
if (amount < bestAmount) {
bestAmount = amount;
}

}


  }
}

//#LOOPVARS: i

contract IMultiToken { }

contract ERC20 { }
