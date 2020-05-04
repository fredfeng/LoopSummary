






contract C {
  

  

  uint256 weiRaisedInPreICO;
mapping(address => uint) EthSentAgainstAddress;
address[] usersAddressForPreICO;
TokenInterface token;

  function foo() public {
    
for(uint i = 0; i < usersAddressForPreICO.length; i++){
uint tks = (((((EthSentAgainstAddress[usersAddressForPreICO[i]]) * (1000000000 * 10 ** 18)))) / (weiRaisedInPreICO));
token.transfer(usersAddressForPreICO[i], tks);
}


  }

  

}

//#LOOPVARS: i


contract TokenInterface {
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

