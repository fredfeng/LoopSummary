
/*
* The Blockchain Football network presents....
* https://fantasyfootballfund.co/
* https://discord.gg/qPjA6Tx
*
* Build your fantasy player portfolio. Earn crypto daily based on player performance.
*
* 4 Ways to earn
* [1] Price Fluctuations - buy and sell at the right moments
* [2] Match day Divs - allocated to shareholders of top performing players every day
* [3] Fame Divs - allocated to shareholders of infamous players on non-match days
* [4] Original Owner - allocated to owners of original player cards on blockchainfootball.co (2% per share sold)
*/

contract PlayerExchangeCore {


    // Ownership
    address public owner;
    address public referee; // Used to pay out divs and initiate an IPO

    // Structs
    struct DividendWinner {
        uint playerTokenContractId;
        uint perTokenEthValue;
        uint totalTokens;
        uint tokensProcessed; // So we can determine when all tokens have been allocated divs + settled
    }

    // State management
    uint internal balancePendingWithdrawal_; // this.balance - balancePendingWithdrawal_ = div prize pool

    // Data Store
    DividendWinner[] public dividendWinners_; // Holds a list of dividend winners (player contract id's, not users)
    mapping(address => uint256) public addressToDividendBalance;

    function allocateDividendsToWinners(uint _dividendWinnerId, address[] memory _winners, uint[] memory _tokenAllocation) public {
        DividendWinner storage divWinner = dividendWinners_[_dividendWinnerId];
        require(divWinner.totalTokens > 0); // Basic check to make sure we don't access a 0'd struct
        require(divWinner.tokensProcessed < divWinner.totalTokens);
        require(_winners.length == _tokenAllocation.length);

        uint totalEthAssigned;
        uint totalTokensAllocatedEth;
        uint ethAllocation;
        address winner;

        for (uint i = 0; i < _winners.length; i++) {
            winner = _winners[i];
            //ethAllocation = _tokenAllocation[i].mul(divWinner.perTokenEthValue);
            ethAllocation = _tokenAllocation[i] * divWinner.perTokenEthValue;
            addressToDividendBalance[winner] = addressToDividendBalance[winner] + ethAllocation;
            //addressToDividendBalance[winner] = addressToDividendBalance[winner].add(ethAllocation);
            totalTokensAllocatedEth = totalTokensAllocatedEth + (_tokenAllocation[i]);
            totalEthAssigned = totalEthAssigned + (ethAllocation);
        }

        // Update balancePendingWithdrawal_ - this allows us to get an accurate reflection of the div pool
        balancePendingWithdrawal_ = balancePendingWithdrawal_ + (totalEthAssigned);

        // As we will likely cause this function in batches this allows us to make sure we don't oversettle (failsafe)
        divWinner.tokensProcessed = divWinner.tokensProcessed + (totalTokensAllocatedEth);

        // This should never occur, but a failsafe for when automated div payments are rolled out
        require(divWinner.tokensProcessed <= divWinner.totalTokens);
    }

}
