
pragma solidity ^0.5.10;



contract C {
  

  address[] _addresses;
mapping(address => uint256) sentTokens;
FidelityHouseToken token;
uint len;
Contributions contributions;
uint256[] _amounts;
uint256[] _bonuses;
uint i;

  function foo() public {
    
for(uint i = 0; i < len; i++){
address _beneficiary = _addresses[i];
uint256 _tokenAmount = _amounts[i];
uint256 _bonusAmount = _bonuses[i];
if (sentTokens[_beneficiary] == 0) {
uint256 totalTokens = (_tokenAmount) + (_bonusAmount);
sentTokens[_beneficiary] = totalTokens;
token.mintAndLock(_beneficiary, _tokenAmount);
token.mint(_beneficiary, _bonusAmount);
contributions.addTokenBalance(_beneficiary, totalTokens);
}

}


  }
}

//#LOOPVARS: i

contract FidelityHouseToken { }

contract Contributions { }
