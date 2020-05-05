






contract C {
  

  

  address[] _owners;
mapping(address => bool) isOwner;

  function foo() public {
    
for(uint i = 0; i < _owners.length; i++){
require(!(isOwner[_owners[i]] || _owners[i] == 0));
isOwner[_owners[i]] = true;
}


  }

  

}

//#LOOPVARS: i


