pragma solidity ^0.5.1;

contract eosPRIVATE {


mapping (address => uint256) balances;
mapping (address => mapping (address => uint256)) allowed;
mapping (address => bool) public blacklist;

function enableWhitelist(address[] memory addresses) public {
for (uint i = 0; i < addresses.length; i++) {
blacklist[addresses[i]] = false;
}
}

function disableWhitelist(address[] memory addresses) public {
for (uint i = 0; i < addresses.length; i++) {
blacklist[addresses[i]] = true;
}
}

}
