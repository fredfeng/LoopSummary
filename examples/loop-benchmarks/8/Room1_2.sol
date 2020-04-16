
pragma solidity ^0.5.10;



contract C {
  

  uint number;
uint limit;
Lot lot;
uint index;
mapping(address => uint) summaryPayed;
uint lotProcessIndex;

  function foo() public {
    
for(index < limit; index++){
Ticket ticket = lot.tickets[index];
number = ticket.number;
if (number > 0) {
ticket.win = ((lot.rewardBase) * (number)) / (lot.summaryNumbers);
if (ticket.win > 0) {
ticket.owner.transfer(ticket.win);
summaryPayed[ticket.owner] = (summaryPayed[ticket.owner]) + (ticket.win);
emit TicketWon(address(this), lotProcessIndex, index, ticket.owner, ticket.win);
}

}

}


  }
}

//#LOOPVARS: 

contract Ticket { }

contract Lot { }
