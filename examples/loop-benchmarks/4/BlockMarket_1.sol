
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
Share[] shares;
uint256 dividendPerRecipient;
uint256 _shareId;
uint256[] sharesForStock;
Stock stock;

  function foo() public {
    
for(uint8 i = 0; i < sharesForStock.length; i++){
if (i != _shareId) {
shares[sharesForStock[i]].holder.transfer(dividendPerRecipient);
stock.dividendsPaid = SafeMath.add(stock.dividendsPaid, dividendPerRecipient);
DividendPaid(shares[sharesForStock[i]].holder, dividendPerRecipient);
}

}


  }
}

//#LOOPVARS: i

contract Stock { }

contract Share { }
