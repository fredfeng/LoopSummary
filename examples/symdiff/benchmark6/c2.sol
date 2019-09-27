pragma solidity ^0.5.10;

contract C2 {
    
    mapping(address => bool) public whitelist;

    function foo(address[] memory addresses, bool status) public {
        for (uint i = 0; i < addresses.length; i++) {
            whitelist[addresses[i]] = status;
        }
    }
}
