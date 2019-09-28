type Ref;
type ContractName;
const unique null: Ref;
const unique C1: ContractName;
var Balance: [Ref]int;
var DType: [Ref]ContractName;
var Alloc: [Ref]bool;
var balance_ADDR: [Ref]int;
var M_int_int: [Ref][int]int;
var M_Ref_Ref: [Ref][Ref]Ref;
var M_Ref_int: [Ref][Ref]int;
var Length: [Ref]int;

var lockTime_C1: [Ref]Ref;
var tempLockTime_C1: [Ref]Ref;
var lockNum_C1: [Ref]Ref;
var later_C1: [Ref]int;
var earlier_C1: [Ref]int;
procedure {:public} foo_C1(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _address_s57: Ref);
implementation foo_C1(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _address_s57: Ref)
{
var i_s55: int;
i_s55 := 0;
while ((i_s55) < (M_Ref_int[lockNum_C1[this]][_address_s57]))
{
M_int_int[M_Ref_Ref[tempLockTime_C1[this]][_address_s57]][i_s55] := ((M_int_int[M_Ref_Ref[lockTime_C1[this]][_address_s57]][i_s55]) + (later_C1[this])) - (earlier_C1[this]);
i_s55 := (i_s55) + (1);
}
}

