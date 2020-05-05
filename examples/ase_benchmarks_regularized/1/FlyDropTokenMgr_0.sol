






contract C {
  

  

  uint256 i;
ERC20 erc20tk;
address[] _destAddrs;
uint256[] _values;

  function foo() public {
    
for(uint i; i < _destAddrs.length; i = ((i) + (1))){
if (!erc20tk.transfer(_destAddrs[i], _values[i])) {
break;
}

}


  }

  

}

//#LOOPVARS: i


contract ERC20 {
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

