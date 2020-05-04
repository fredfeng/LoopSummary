






contract C {
  

  

  uint startIndex;
uint endIndex;
uint256 totalSupply;
uint totalWeiToBeDistributed;
mapping(uint256 => address) addresses;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = startIndex; i < endIndex; ++i){
address holder = addresses[i + 1];
uint reward = (((balances[holder]) * (totalWeiToBeDistributed))) / (totalSupply);
holder.transfer(reward);
}


  }

  

}

//#LOOPVARS: i


contract address {
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

