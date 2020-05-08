






contract C {
  

  

  uint256[] _amounts;
address[] _recipients;
uint256 dropAmount;
uint256 numDrops;
mapping(address => bool) signaturedrops;
PolicyPalNetworkToken token;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
address recipient = _recipients[i];
uint256 amount = _amounts[i];
if (!signaturedrops[recipient]) {
assert(token.transfer(recipient, amount));
signaturedrops[recipient] = true;
numDrops = ((numDrops) + (1));
dropAmount = ((dropAmount) + (amount));

}

}


  }

  

}

//#LOOPVARS: i


contract PolicyPalNetworkToken {
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

