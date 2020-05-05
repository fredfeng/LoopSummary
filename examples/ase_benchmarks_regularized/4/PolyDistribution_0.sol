






contract C {
  

  

  address[] _recipient;
uint256 decimalFactor;
PolyToken POLY;
mapping(address => bool) airdrops;
uint airdropped;

  function foo() public {
    
for(uint256 i = 0; i < _recipient.length; i++){
if (!airdrops[_recipient[i]]) {
airdrops[_recipient[i]] = true;
require(POLY.transfer(_recipient[i], 250 * decimalFactor));
airdropped = ((airdropped) + (250 * decimalFactor));
}

}


  }

  

}

//#LOOPVARS: i


contract PolyToken {
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

