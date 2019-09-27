pragma solidity ^0.5.10;

contract C1 {
    
    mapping(address => bool) public whitelist;

    function foo(address[] memory addresses, bool status) public {
        for (uint256 i = 0; i < addresses.length; i++) {
            address contributorAddress = addresses[i];
            whitelist[contributorAddress] = status;
        }
    }
}


