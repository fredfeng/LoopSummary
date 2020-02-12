

contract Policypal {

   mapping(address => bool)       public whitelistAddresses;
    function updateWhitelists(address[] memory _users, bool[] memory _allows) public
    {
        require(_users.length == _allows.length);
        for (uint i = 0 ; i < _users.length ; i++) {
            address _user = _users[i];
            bool _allow = _allows[i];
            whitelistAddresses[_user] = _allow;
        }
    }

}
