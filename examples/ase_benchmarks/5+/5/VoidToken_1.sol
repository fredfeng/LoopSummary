






contract C {
  

  

  address[] addresses;
uint256 totalAirDropped;
mapping(address => bool) air_dropped;
uint256 totalSupply_;
uint256 value;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(value <= totalSupply_);
require(air_dropped[addresses[i]] == false);
air_dropped[addresses[i]] = true;
transfer(addresses[i], value);
totalAirDropped = ((totalAirDropped) + (value));
}


  }

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

//#LOOPVARS: i


