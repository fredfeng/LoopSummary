pragma solidity ^0.5.1;

/*
* ZETHR PRESENTS: SLOTS
*
* Written August 2018 by the Zethr team for zethr.io.
*
* Code framework written by Norsefire.
* EV calculations written by TropicalRogue.
* Audit and edits written by Klob.
* Multiroll framework written by Etherguy.
*
* Rolling Odds:
*   49.31%  Lose    
*   35.64%  Two Matching Icons
*       - 10.00% : 2x    Multiplier [Two Rockets]
*       - 15.00% : 1.33x Multiplier [Two Gold  Pyramids]
*       - 15.00% : 1x    Multiplier [Two 'Z' Symbols]
*       - 15.00% : 1x    Multiplier [Two 'T' Symbols]
*       - 15.00% : 1x    Multiplier [Two 'H' Symbols]
*       - 15.00% : 1.33x Multiplier [Two Purple Pyramids]
*       - 15.00% : 2x    Multiplier [Two Ether Icons]
*   6.79%   One Of Each Pyramid
*       - 1.5x  Multiplier
*   2.94%   One Moon Icon
*       - 2.5x Multiplier
*   5.00%   Three Matching Icons
*       -  3.00% : 12x   Multiplier [Three Rockets]
*       -  5.00% : 10x   Multiplier [Three Gold  Pyramids]
*       - 27.67% : 7.5x  Multiplier [Three 'Z' Symbols]
*       - 27.67% : 7.5x  Multiplier [Three 'T' Symbols]
*       - 27.67% : 7.5x  Multiplier [Three 'H' Symbols]
*       -  5.00% : 10x   Multiplier [Three Purple Pyramids]
*       -  4.00% : 15x   Multiplier [Three Ether Icons]
*   0.28%   Z T H Prize
*       - 20x Multiplier
*   0.03%   Two Moon Icons
*       - 50x  Multiplier
*   0.0001% Three Moon Grand Jackpot
*       - Jackpot Amount (variable)
*
*   From all of us at Zethr, thank you for playing!    
*
*/


// Contract that contains the functions to interact with the bankroll system
contract ZethrBankrollBridge {
   
    // Store the bankroll addresses 
    // address[0] is main bankroll 
    // address[1] is tier1: 2-5% 
    // address[2] is tier2: 5-10, etc
    address[7] UsedBankrollAddresses; 

    // Mapping for easy checking
    mapping(address => bool) ValidBankrollAddress;
    
    // Set up the tokenbankroll stuff 
    function setupBankrollInterface(address ZethrMainBankrollAddress) internal {

        // Get the bankroll addresses from the main bankroll
        for(uint i=0; i<7; i++){
            ValidBankrollAddress[UsedBankrollAddresses[i]] = true;
        }
    }
}


