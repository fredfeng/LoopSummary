






contract C {
  

  

  LinkableRing.Data ring;
mapping(uint256 => bytes32) m_pubx_to_ring;

  function foo() public {
    
for(uint i = 0; i < ring.pubkeys.length; i++){
delete m_pubx_to_ring[ring.pubkeys[i].X];
}


  }

  

}

//#LOOPVARS: i



contract LinkableRing.Data { }
