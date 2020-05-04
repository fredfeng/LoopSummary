






contract C {
  

  

  address[] _investors;
ERC20BasicInterface token;
uint decimalsForCalc;
uint256[] _tokenAmounts;

  function foo() public {
    
for(uint i = 0; i < _investors.length; i++){
require(_tokenAmounts[i] > 0 && _investors[i] != 0x0);
_tokenAmounts[i] = ((_tokenAmounts[i]) * (decimalsForCalc));
require(token.transfer(_investors[i], _tokenAmounts[i]));
}


  }

  

}

//#LOOPVARS: i


contract ERC20BasicInterface {
  mapping (address => uint256) _balances;

function transfer(address recipient, uint256 amount) public returns (bool) {
    _transfer(_msgSender(), recipient, amount);
    return true;
}


function _transfer(address sender, address recipient, uint256 amount) internal {
    require(sender != address(0), "ERC20: transfer from the zero address");
    require(recipient != address(0), "ERC20: transfer to the zero address");

    _balances[sender] = _balances[sender] - amount;
    _balances[recipient] = _balances[recipient] + amount;
}

function _msgSender() public returns (address) {
    return msg.sender;
}

}

