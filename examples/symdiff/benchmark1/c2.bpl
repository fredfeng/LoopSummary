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
var M_Ref_Ref: [Ref][Ref]Ref;
var M_Ref_int: [Ref][Ref]int;
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
var __var_1: Ref;
var __var_2: Ref;
var __var_3: Ref;
// start of initialization
assume ((msgsender_MSG) != (null));
later_C2[this] := 1;
earlier_C2[this] := 2;
// Make array/mapping vars distinct for tempLockTime
call __var_1 := FreshRefGenerator();
tempLockTime_C2[this] := __var_1;
// Initialize length of 1-level nested array in tempLockTime
assume (forall  __i__0_0:Ref ::  ((Length[M_Ref_Ref[tempLockTime_C2[this]][__i__0_0]]) == (0)));
assume (forall  __i__0_0:Ref ::  (!(Alloc[M_Ref_Ref[tempLockTime_C2[this]][__i__0_0]])));
call HavocAllocMany();
assume (forall  __i__0_0:Ref ::  (Alloc[M_Ref_Ref[tempLockTime_C2[this]][__i__0_0]]));
assume (forall  __i__0_0:Ref, __i__0_1:Ref :: {M_Ref_Ref[tempLockTime_C2[this]][__i__0_0], M_Ref_Ref[tempLockTime_C2[this]][__i__0_1]} (((__i__0_0) == (__i__0_1)) || ((M_Ref_Ref[tempLockTime_C2[this]][__i__0_0]) != (M_Ref_Ref[tempLockTime_C2[this]][__i__0_1]))));
// Make array/mapping vars distinct for lockTime
call __var_2 := FreshRefGenerator();
lockTime_C2[this] := __var_2;
// Initialize length of 1-level nested array in lockTime
assume (forall  __i__0_0:Ref ::  ((Length[M_Ref_Ref[lockTime_C2[this]][__i__0_0]]) == (0)));
assume (forall  __i__0_0:Ref ::  (!(Alloc[M_Ref_Ref[lockTime_C2[this]][__i__0_0]])));
call HavocAllocMany();
assume (forall  __i__0_0:Ref ::  (Alloc[M_Ref_Ref[lockTime_C2[this]][__i__0_0]]));
assume (forall  __i__0_0:Ref, __i__0_1:Ref :: {M_Ref_Ref[lockTime_C2[this]][__i__0_0], M_Ref_Ref[lockTime_C2[this]][__i__0_1]} (((__i__0_0) == (__i__0_1)) || ((M_Ref_Ref[lockTime_C2[this]][__i__0_0]) != (M_Ref_Ref[lockTime_C2[this]][__i__0_1]))));
// Make array/mapping vars distinct for lockNum
call __var_3 := FreshRefGenerator();
lockNum_C2[this] := __var_3;
// Initialize Integer mapping lockNum
assume (forall  __i__0_0:Ref ::  ((M_Ref_int[lockNum_C2[this]][__i__0_0]) == (0)));
// end of initialization
}

procedure {:inline 1} C2_C2(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation C2_C2(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call C2_C2_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

var tempLockTime_C2: [Ref]Ref;
var lockTime_C2: [Ref]Ref;
var lockNum_C2: [Ref]Ref;
var later_C2: [Ref]int;
var earlier_C2: [Ref]int;
procedure {:public} {:inline 1} foo_C2(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _address_s57: Ref);
implementation foo_C2(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _address_s57: Ref)
{
var i_s56: int;
i_s56 := 0;
while ((i_s56) < (M_Ref_int[lockNum_C2[this]][_address_s57]))
{
M_int_int[M_Ref_Ref[tempLockTime_C2[this]][_address_s57]][i_s56] := ((M_int_int[M_Ref_Ref[lockTime_C2[this]][_address_s57]][i_s56]) + (later_C2[this])) - (earlier_C2[this]);
i_s56 := (i_s56) + (1);
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
modifies M_Ref_Ref;
modifies M_Ref_int;
modifies Length;
modifies tempLockTime_C2;
modifies lockTime_C2;
modifies lockNum_C2;
modifies later_C2;
modifies earlier_C2;
implementation Fallback_UnknownType(from: Ref, to: Ref, amount: int)
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var _address_s57: Ref;
if ((choice) == (1)) {
call foo_C2(this, msgsender_MSG, msgvalue_MSG, _address_s57);
}
}


