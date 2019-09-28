pragma solidity ^0.5.10;

contract C1 {
    
    mapping (address => uint256) private lockNum;
    mapping (address => uint256[]) private lockValue;

    function foo(address _address, uint _balance) public {

        uint i = 0;
        while (i < lockNum[_address]) {
            _balance = _balance + (lockValue[_address][i]);
            i++;
        }

    }
}



