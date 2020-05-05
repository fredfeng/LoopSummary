






contract C {
  

  

  address[] _recipients;
uint256[] _balances;
Token token;
uint airDropped;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
require(token.transfer(_recipients[i], _balances[i]));
airDropped = ((airDropped) + (_balances[i]));
}


  }

  

}

//#LOOPVARS: i


contract Token {
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

