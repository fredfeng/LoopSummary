






contract C {
  

  

  address[] _recipients;
ERC20 token;
uint totalClaimed;
mapping(address => bool) tokenReceived;
uint[] _amounts;

  function foo() public {
    
for(uint i = 0; i < _recipients.length; i++){
require(_recipients[i] != address(0));
require(tokenReceived[_recipients[i]] == false);
require(token.transfer(_recipients[i], _amounts[i]));
tokenReceived[_recipients[i]] = true;
totalClaimed = ((totalClaimed) + (_amounts[i]));
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

