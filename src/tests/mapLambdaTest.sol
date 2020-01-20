// simple copy range: copyRange2(a, 0, b, 0, 10)
contract C{
    mapping (uint => uint) a;
    /* mapping (uint => uint) b; */
    uint strt;
    uint end;
    uint c;
    
    // INDEX: i
    // GUARD: i    
    // WRITTEN: a, i
    // READ: b, i
    // a' <-- b, a' <-- i, i' <-- i
    function foo() public{
      for (uint i = strt; i < end; i++) {
    	a[i] += 10*c+5+7;
      }
    }

}
