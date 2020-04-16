
pragma solidity ^0.5.10;



contract C {
  

  InvestorPosition[] investorPositions;
uint256 i;
mapping(address => uint256) affiliateCommision;
address referral;
uint256 amount;
bool flaggedRef;

  function foo() public {
    
for(uint256 i = 0; i < investorPositions.length; i++){
InvestorPosition position = investorPositions[i];
if (position.investor == referral) {
flaggedRef = true;
}

if (position.investor != msg.sender) {
uint256 commision = SafeMath.div(SafeMath.mul(amount, position.percentageCut), 100);
affiliateCommision[position.investor] = SafeMath.add(affiliateCommision[position.investor], commision);
}

}


  }
}

//#LOOPVARS: i

contract InvestorPosition { }
