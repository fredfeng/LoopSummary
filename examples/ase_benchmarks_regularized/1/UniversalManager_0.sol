






contract C {
  

  

  UniversalCoin token;
uint256 max;
address[] participants;
uint256 index;
uint256 _amount;

  function foo() public {
    
for(uint i = index; i < max; i++){
token.transfer(participants[i], _amount);
}


  }

  

}

//#LOOPVARS: i


contract UniversalCoin {
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
