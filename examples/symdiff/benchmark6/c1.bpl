type Ref;
type ContractName;
const unique null: Ref;
const unique C1: ContractName;
function ConstantToRef(x: int) returns (ret: Ref);
function keccak256(x: int) returns (ret: int);
function abiEncodePacked1(x: int) returns (ret: int);
function _SumMapping_VeriSol(x: [Ref]int) returns (ret: int);
function abiEncodePacked2(x: int, y: int) returns (ret: int);
function abiEncodePacked1R(x: Ref) returns (ret: int);
function abiEncodePacked2R(x: Ref, y: int) returns (ret: int);
var Balance: [Ref]int;
var DType: [Ref]ContractName;
var Alloc: [Ref]bool;
var balance_ADDR: [Ref]int;
var M_Ref_bool: [Ref][Ref]bool;
var M_int_Ref: [Ref][int]Ref;
var Length: [Ref]int;
procedure {:inline 1} FreshRefGenerator() returns (newRef: Ref);
implementation FreshRefGenerator() returns (newRef: Ref)
{
havoc newRef;
assume ((Alloc[newRef]) == (false));
Alloc[newRef] := true;
assume ((newRef) != (null));
}

procedure {:inline 1} HavocAllocMany();
implementation HavocAllocMany()
{
var oldAlloc: [Ref]bool;
oldAlloc := Alloc;
havoc Alloc;
assume (forall  __i__0_0:Ref ::  ((oldAlloc[__i__0_0]) ==> (Alloc[__i__0_0])));
}

procedure boogie_si_record_sol2Bpl_int(x: int);
procedure boogie_si_record_sol2Bpl_ref(x: Ref);
procedure boogie_si_record_sol2Bpl_bool(x: bool);
procedure {:inline 1} C1_C1_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation C1_C1_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_1: Ref;
// start of initialization
assume ((msgsender_MSG) != (null));
// Make array/mapping vars distinct for whitelist
call __var_1 := FreshRefGenerator();
whitelist_C1[this] := __var_1;
// Initialize Boolean mapping whitelist
assume (forall  __i__0_0:Ref ::  (!(M_Ref_bool[whitelist_C1[this]][__i__0_0])));
// end of initialization
}

procedure {:inline 1} C1_C1(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation C1_C1(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call C1_C1_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

var whitelist_C1: [Ref]Ref;
procedure {:public} {:inline 1} foo_C1(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, addresses_s39: Ref, status_s39: bool);
implementation foo_C1(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, addresses_s39: Ref, status_s39: bool)
{
var i_s37: int;
var contributorAddress_s36: Ref;
i_s37 := 0;
while ((i_s37) < (Length[addresses_s39]))
{
contributorAddress_s36 := M_int_Ref[addresses_s39][i_s37];
M_Ref_bool[whitelist_C1[this]][contributorAddress_s36] := status_s39;
i_s37 := (i_s37) + (1);
}
}

procedure {:inline 1} FallbackDispatch(from: Ref, to: Ref, amount: int);
implementation FallbackDispatch(from: Ref, to: Ref, amount: int)
{
if ((DType[to]) == (C1)) {
assume ((amount) == (0));
} else {
call Fallback_UnknownType(to, from, amount);
}
}

procedure {:inline 1} Fallback_UnknownType(from: Ref, to: Ref, amount: int);
modifies Balance;
modifies DType;
modifies Alloc;
modifies balance_ADDR;
modifies M_Ref_bool;
modifies M_int_Ref;
modifies Length;
modifies whitelist_C1;

