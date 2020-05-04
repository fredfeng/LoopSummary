# Loop Summarization for Smart Contracts

### Known Issues

1. When testing `nestedRequireTest.sol`, the prod `REQUIRE__address` is automatically inferred even if I comment it out. I may only need `REQUIRE__uint`.
2. (minor) `op = "<" if isAscending else "<" ` in Ln977 `analysis_loop_summary_synthesizer.py`.

### Recent Logs

| test case                   | w/o pruning | w/ pruning  |
| --------------------------- | ----------- | ----------- |
| `sumTestBody.sol`           | ✅           | ✅           |
| `sumTestLBody.sol`          | ✅           |             |
| `nestedSumTest.sol`         | ✅           | (exception) |
| `nestsedSumLTest.sol`       |             |             |
| `copyRangeTest.sol`         | ✅           | ✅           |
| `copyRangeLTest.sol`        |             |             |
| `nestedCopyRangeTest.sol`   | ✅           | ✅           |
| `nestedCopyRangeLTest.sol`  |             |             |
| `incRangeTest.sol`          | ✅           | ✅           |
| `incRangeLTest.sol`         |             |             |
| `nestedIncRangeTest.sol`    | ✅           | ✅           |
| `nestedIncRangeLTest.sol`   |             |             |
| `mapTest.sol`               | ✅           | ✅           |
| `mapLTest.sol`              |             |             |
| `updateRangeTest.sol`       | ✅           | ✅           |
| `requireTest.sol`           | ✅           | ✅           |
| `nestedRequireTest.sol`     | ✅           | ✅           |
| `requireBoolTest.sol`       | ✅           | ✅           |
| `nestedRequireBoolTest.sol` | ✅           | ✅           |
| `requireAddressTest.sol`    | ✅           | ✅           |
| `requireOrderedTest.sol`    | ✅           | ✅           |
| `transferTest.sol`          |             |             |
| `requireTransferTest.sol`   |             |             |
| others                      | (working)   | (working)   |

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
python ./bmc-synthesizer.py --file <your_benchmark> [--prune] [--verbose]
```

### Bounded Model Checker

You can also debug the bounded model checker by:

```bash
cd ./src/rosette
racket ./bmc-rosette.rkt '<json_intermediate_ir>'
```

### Quick Commands

###### testing on a benchmark and time it

> --verbose: show more debugging information for developer

```
time python ./bmc-synthesizer.py --file ../examples/loop-benchmarks/3/GPYToken_0.sol --prune --verbose
```

###### testing on a sanity checking program and time it

> --verbose: show more debugging information for developer

```
time python ./bmc-synthesizer.py --file ./tests/requireTest.sol --prune --verbose
```

