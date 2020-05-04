






contract C {
  

  

  ShizzleNizzle SHNZ;
uint256 _amount;
address[] _addrs;

  function foo() public {
    
for(uint i = 0; i < _addrs.length; i++){
if (_addrs[i] != 0x0) {
SHNZ.transfer(_addrs[i], ((_amount) * (100000000)));
}

}


  }

  

}

//#LOOPVARS: i


contract ShizzleNizzle {
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

