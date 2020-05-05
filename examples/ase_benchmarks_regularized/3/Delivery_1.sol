






contract C {
  

  

  uint256[] _vamounts;
address[] _vaddr;
Peculium pecul;
uint256 decimals;

  function foo() public {
    
for(uint256 index = 0; index < _vaddr.length; index++){
address toAddress = _vaddr[index];
uint256 amountTo_Send = ((_vamounts[index]) * (10 ** decimals));
pecul.transfer(toAddress, amountTo_Send);

}


  }

  

}

//#LOOPVARS: index


contract Peculium {
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

