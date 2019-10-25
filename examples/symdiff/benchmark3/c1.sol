pragma solidity ^0.5.10;

contract C1 {
    
    mapping (address => uint256) private lockNum;
    mapping (address => uint256[]) private lockValue;
    uint _balance;

    function foo(address _address) public {

        uint i = 0;
        while (i < lockNum[_address]) {
            _balance = _balance + (lockValue[_address][i]);
            i++;
        }

    }
}



