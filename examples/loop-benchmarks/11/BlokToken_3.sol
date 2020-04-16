
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => TokenGrant) tokenGrants;
VestingTrustee trustee;
address[] tokenGrantees;
uint endIndex;
uint256 lastGrantedIndex;
uint i;

  function foo() public {
    
for(uint i = lastGrantedIndex; i < endIndex; i++){
address grantee = tokenGrantees[i];
TokenGrant tokenGrant = tokenGrants[grantee];
uint256 tokensGranted = tokenGrant.value;
uint256 tokensVesting = ((tokensGranted) * (tokenGrant.percentVested)) / (100);
uint256 tokensIssued = (tokensGranted) - (tokensVesting);
if (tokensIssued > 0) {
issueTokens(grantee, tokensIssued);
}

if (tokensVesting > 0) {
issueTokens(trustee, tokensVesting);
trustee.grant(grantee, tokensVesting, (now) + (tokenGrant.startOffset), (now) + (tokenGrant.cliffOffset), (now) + (tokenGrant.endOffset), tokenGrant.installmentLength, true);
}

lastGrantedIndex++;
}


  }
}

//#LOOPVARS: i

contract VestingTrustee { }

contract TokenGrant { }
