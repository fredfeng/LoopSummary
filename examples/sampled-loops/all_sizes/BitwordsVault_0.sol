
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => address) publisherAffiliates;
uint256[] advertiserIds;
address[] publishers;
uint256[] costs;
mapping(uint256 => address) advertiserAffiliates;
uint256 i;
address bitwordsWithdrawalAddress;
mapping(uint256 => uint256) bitwordsCutOverride;
uint256[] publisherIds;
uint256 affiliatesCutOutof100;
uint256 bitwordsCutOutof100;

  function foo() public {
    
for(uint256 i = 0; i < advertiserIds.length; i++){
uint256 toWithdraw = costs[i];
emit DeductFromAdvertiser(advertiserIds[i], toWithdraw);
uint256 bitwordsCutPercent = bitwordsCutOutof100;
if (bitwordsCutOverride[publisherIds[i]] > 0 && bitwordsCutOverride[publisherIds[i]] <= 30) {
bitwordsCutPercent = bitwordsCutOverride[publisherIds[i]];
}

uint256 publisherNetCut = toWithdraw * (100 - bitwordsCutPercent) / 100;
uint256 bitwordsCut = (toWithdraw) - (publisherNetCut);
uint256 bitwordsNetCut = bitwordsCut;
uint256 affiliateCut = (affiliatesCutOutof100) * (bitwordsNetCut);
queueTransfer(publishers[i], publisherNetCut, 0);
if (advertiserAffiliates[advertiserIds[i]] != address(0)) {
queueTransfer(advertiserAffiliates[advertiserIds[i]], affiliateCut, 2);
bitwordsCut = (bitwordsCut) - (affiliateCut);
}

if (publisherAffiliates[publisherIds[i]] != address(0)) {
queueTransfer(publisherAffiliates[advertiserIds[i]], affiliateCut, 3);
bitwordsCut = (bitwordsCut) - (affiliateCut);
}

queueTransfer(bitwordsWithdrawalAddress, bitwordsCut, 1);
}


  }
}

//#LOOPVARS: i
