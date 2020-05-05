# Loop Summarization for Smart Contracts

**(Notice: Currently the regularized benchmark folder is `./examples/ase_benchmarks_regularized/`.)**

### Known Issues

1. ~~(minor) When testing `nestedRequireTest.sol`, the prod `REQUIRE__address` is automatically inferred even if I comment it out. I may only need `REQUIRE__uint`.~~
2. ~~(minor) `op = "<" if isAscending else "<" ` in Ln977 `analysis_loop_summary_synthesizer.py`.~~
3. ~~`1/Halo3DPotPotato_2.sol` has a comment `//#LOOPVARS: i` where there's no `i` as loop var in the benchmark.~~
4. ~~When loop var is not defined in the `for` scope, the read/write set detection becomes difficult. So I'm going to regularize all loop vars such that: they are defined in loop expr. Not sure what will happen to `while` loop yet.~~
5. ~~`nestedRequireBoolTest.sol`: Even if I uncomment the prods `bool_arrT2` and `bool_arrF2`, they are not inferred in the instantiated dsl.~~
6. ~~`1/Mineral_14.sol` has a wrong label of `//#LOOPVARS`.  I already corrected it.~~

### Recent Logs

| test case                   | no pruning + rw | pruning     |
| --------------------------- | --------------- | ----------- |
| `sumTestBody.sol`           | ✅               | ✅           |
| `sumTestLBody.sol`          | ✅               |             |
| `nestedSumTest.sol`         | ✅               | (exception) |
| `nestsedSumLTest.sol`       | 🐢               |             |
| `copyRangeTest.sol`         | ✅               | ✅           |
| `copyRangeLTest.sol`        | ✅               |             |
| `nestedCopyRangeTest.sol`   | ✅               | ✅           |
| `nestedCopyRangeLTest.sol`  |                 |             |
| `incRangeTest.sol`          | ✅               | ✅           |
| `incRangeLTest.sol`         | ✅               |             |
| `nestedIncRangeTest.sol`    | ✅               | ✅           |
| `nestedIncRangeLTest.sol`   |                 |             |
| `mapTest.sol`               | ✅               | ✅           |
| `mapLTest.sol`              | ✅🐢              |             |
| `updateRangeTest.sol`       | ✅               | ✅           |
| `requireTest.sol`           | ✅               | ✅           |
| `nestedRequireTest.sol`     | ✅               | ✅           |
| `requireBoolTest.sol`       | ✅               | ✅           |
| `nestedRequireBoolTest.sol` | ✅               | ✅           |
| `requireAddressTest.sol`    | ✅               | ✅           |
| `requireOrderedTest.sol`    | ✅               | ✅           |
| `transferTest.sol`          | ✅               | ✅           |
| `transferLTest.sol`         | ✅               |             |
| `requireTransferTest.sol`   | ✅               | ✅           |
| `requireTransferLTest.sol`  | ✅               |             |

### Getting Started

1. Download ([link](https://racket-lang.org/download/)) and install Racket (v7 or later) if you do not already have it installed on your system.
   - Make sure that the Racket binaries are available on your `PATH`.
2. Download ([link](https://github.com/emina/rosette)) and install Rosette.
3. Compile the bounded model checker (in Rosette) into executable:

```bash
cd ./src/rosette
raco exe ./bmc-rosette.rkt
```

4. Then run the bmc synthesizer:

> Notice: You may need to comment/uncomment some prods in `dsl_skeleton` to speed up / debug some benchmark solving.

```bash
python ./bmc-synthesizer.py --file <your_benchmark> [--timeout t] [--prune] [--verbose]
```

### Bounded Model Checker

You can also debug the bounded model checker by:

```bash
cd ./src/rosette
racket ./bmc-rosette.rkt '<json_intermediate_ir>'
```

### Quick Commands

###### testing on a benchmark

> --verbose: show more debugging information for developer

```
python ./bmc-synthesizer.py --file ../examples/ase_benchmarks_regularized/1/ACATokenSale_2.sol --timeout 600 --prune --verbose
```

###### testing on a sanity checking program

> --verbose: show more debugging information for developer

```
python ./bmc-synthesizer.py --file ./tests/requireTest.sol --timeout 600 --prune --verbose
```

###### debugging on a sanity checking program

```
python ./bmc-synthesizer.py --file ./tests/mapTest.sol > ./test.log  2>&1
python ./bmc-synthesizer.py --file ./tests/mapTest.sol --verbose
```

###### running a batch evaluation

> modify the script for customized running

```
./experiments/run.sh
./experiments/run_batch.sh <size> [[prefix] or empty]
```

###### read and explain the experiment logs

```
python ./creep.py --folder <log_folder>
```

### Explanation about the Design of Type-Directed Search Engine (Read-Write Pruning)

> --- Why is it designed in the current way? ---

1. [From SlitherIR to RosetteIR] Since there's a notion of "reference variable" in SlitherIR, when translating an `Index` IR, the current translator will directly issue a corresponding `ARRAY-READ` in RosetteIR, no matter whether the read value will be used on the LHS or RHS in the future. This will result in some cases a redundant `ARRAY-READ`, which actually affects the accuracy of the detection of read/write set, if we are to extract the read/write set along with the translation from SlitherIR to RosetteIR.
2. [From Trinity to RosetteIR] There won't be any redundant `ARRAY-READ` along this path.
3. So the current solution is, since Slither's original parsing of read/write set is accurate, but with loop vars removed, the only thing we need is to find the loop vars and add it to the read/write set (in `for` loop, not `while` loop). This will give us aligned read/write sets from both Trinity and SlitherIR so that we can compare.
4. The Trinity side uses global trace list to keep track of the read/write/loop set, since there are several nodes that only return partial instructions, which will make it harder to return full read/write/loop set in every node evaluation. On the contrary, the SlitherIR side uses local trace list since the translation is done by scanning instructions one by one and it's more concise and possible to construct the lists in a periodic way.