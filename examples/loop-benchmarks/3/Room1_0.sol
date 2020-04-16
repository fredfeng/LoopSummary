
pragma solidity ^0.5.10;



contract C {
  

  Lot lot;
uint numTicketsToBuy;
uint ticketPrice;
uint curLotIndex;
uint i;

  function foo() public {
    
for(uint i = 0; i < numTicketsToBuy; i++){
lot.tickets[lot.ticketsCount].owner = msg.sender;
emit TicketPurchased(address(this), curLotIndex, lot.ticketsCount, msg.sender, ticketPrice);
lot.ticketsCount = (lot.ticketsCount) + (1);
}


  }
}

//#LOOPVARS: i

contract Lot { }
