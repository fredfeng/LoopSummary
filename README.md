# Loop Summarization for Smart Contracts

### Known Issues

1. `sumLTestBody.sol`: the token `5` is not recognized as in `enum uint`, which fails the test. I suspect this <u>will happen to all the test with lambdas</u>.
2. The `build_map` method in `analysis_loop_summary_synthesizer.py` needs updates: its `args` interpretation is out-of-sync with other `build` methods.
3. The `TRANSFER` prod disappears after the dsl instantiation (even in `no pruning` mode).
4. Using `--prune` while testing `nestedSumTest.sol` will call `eval_lambda`, which is not suggested to be used by Ben.
5. I don't get the design of `requireSumTest.sol` and `nestedRequireSumTest.sol`.
6. When testing `nestedRequireTest.sol`, the prod `REQUIRE__address` is automatically inferred even if I comment it out. I may only need `REQUIRE__uint`.

### Recent Logs

| test case                         | w/o pruning     | w/ pruning      |
| --------------------------------- | --------------- | --------------- |
| `sumTestBody.sol`                 | ✅               | ✅               |
| `sumTestLBody.sol`                | (known issue 1) | (known issue 1) |
| `nestedSumTest.sol`               | ✅               | (exception)     |
| `nestsedSumLTest.sol`             | (known issue 1) | (known issue 1) |
| `copyRangeTest.sol`               | ✅               | ✅               |
| `copyRangeLTest.sol`              | (known issue 1) | (known issue 1) |
| `nestedCopyRangeTest.sol`         | ✅               | ✅               |
| `nestedCopyRangeLTest.sol`        | (known issue 1) | (known issue 1) |
| `incRangeTest.sol`                | ✅               | ✅               |
| `incRangeLTest.sol`               | (known issue 1) | (known issue 1) |
| `nestedIncRangeTest.sol`          | ✅               | ✅               |
| `nestedIncRangeLTest.sol`         | (known issue 1) | (known issue 1) |
| `mapTest.sol`                     | ✅               | ✅               |
| `mapLTest.sol`                    | (known issue 1) | (known issue 1) |
| `updateRangeTest.sol`             | ✅               | ✅               |
| `requireTest.sol`                 | ✅               | ✅               |
| `nestedRequireTest.sol`           | ✅               | ✅               |
| `requireBoolTest.sol`             | ✅               | ✅               |
| `nestedRequireBoolTest.sol`       | ✅               | ✅               |
| `requireSumTest.sol`🔮(why?)       | 🔮               | 🔮               |
| `nestedRequireSumTest.sol`🔮(why?) | 🔮               | 🔮               |
| `requireAddressTest.sol`          | ✅               | ✅               |
| others                            | (working)       | (working)       |

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
python ./bmc-synthesizer.py --file <your_benchmark> --prune
```

### Bounded Model Checker

You can also debug the bounded model checker by:

```bash
cd ./src/rosette
racket ./bmc-rosette.rkt '<json_intermediate_ir>'
```

### Quick Commands

###### testing on a benchmark and time it

```
time python ./bmc-synthesizer.py --file ../examples/loop-benchmarks/3/GPYToken_0.sol --prune
```

###### testing on a sanity checking program and time it

```
time python ./bmc-synthesizer.py --file ./tests/requireTest.sol --prune
```

