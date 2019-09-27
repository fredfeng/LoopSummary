type Ref;
type ContractName;
const unique null: Ref;
const unique C2: ContractName;
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
var M_int_int: [Ref][int]int;
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
procedure {:inline 1} C2_C2_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation C2_C2_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
Factor_C2[this] := 1000;
// end of initialization
}

procedure {:inline 1} C2_C2(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation C2_C2(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call C2_C2_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

var Factor_C2: [Ref]int;
procedure {:public} {:inline 1} foo_C2(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _amountOfLands_s39: Ref);
implementation foo_C2(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _amountOfLands_s39: Ref)
{
var totalAmount_s38: int;
var i_s37: int;
totalAmount_s38 := 0;
i_s37 := 0;
while ((i_s37) < (Length[_amountOfLands_s39]))
{
totalAmount_s38 := (totalAmount_s38) + (((M_int_int[_amountOfLands_s39][i_s37]) * (Factor_C2[this])));
i_s37 := (i_s37) + (1);
}
}

procedure {:inline 1} FallbackDispatch(from: Ref, to: Ref, amount: int);
implementation FallbackDispatch(from: Ref, to: Ref, amount: int)
{
if ((DType[to]) == (C2)) {
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
modifies M_int_int;
modifies Length;
modifies Factor_C2;

