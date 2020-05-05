






contract C {
  

  

  uint[] values;
uint multiplier;
address[] dests;
ERC20Basic token;

  function foo() public {
    
for(uint256 i = 0; i < dests.length; i++){
token.transfer(dests[i], ((values[i]) * (multiplier)));
}


  }

  

}

//#LOOPVARS: i


contract ERC20Basic {
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

