






contract C {
  

  

  mapping(address => uint) contributionsToken;
uint256 lastIndex;
mapping(uint => address) addresses;
token tokenReward;
uint _4percent;
uint _6percent;
mapping(address => uint) contributionsEth;
uint totalWei;
uint totalTokens;

  function foo() public {
    
for(uint i = 1; i <= lastIndex; i++){
address holder = addresses[i];
uint _rewardTokens = ((((contributionsToken[holder]) * (_6percent))) / (totalTokens));
uint _rewardWei = ((((contributionsEth[holder]) * (_4percent))) / (totalWei));
tokenReward.transfer(holder, ((_rewardTokens) + (_rewardWei)));
}


  }

  

}

//#LOOPVARS: i


contract token {
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

