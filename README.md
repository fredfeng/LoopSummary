# Loop Summarization for Smart Contracts

**(Notice: Currently the regularized benchmark folder is `./examples/ase_benchmarks_regularized/`.)**

### Known Issues

1. Currently the tool ignores `Condition` node, i.e., it can't handle if-else condition.
2. Currently the tool may not be compatible with `while` loop.
3. The tool needs to support `&&` operator (as well as other logical operator).

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
./experiments/run_batch.sh <size> [[prefix] or empty] [[timeout]]
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

### Azure Configurations

```
ssh -i ~/.ssh/ju-ucsb ju-ucsb@13.64.187.87
ssh -i ~/.ssh/ju-ucsb ju-ucsb@104.40.18.86
ssh -i ~/.ssh/ju-ucsb ju-ucsb@104.42.22.122
ssh -i ~/.ssh/ju-ucsb ju-ucsb@13.91.104.61
ssh -i ~/.ssh/ju-ucsb ju-ucsb@23.99.8.170
ssh -i ~/.ssh/ju-ucsb ju-ucsb@40.112.181.253
ssh -i ~/.ssh/ju-ucsb ju-ucsb@23.101.200.46
ssh -i ~/.ssh/ju-ucsb ju-ucsb@104.42.77.220

# install Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
source ~/.bashrc

# install Racket
sudo add-apt-repository ppa:plt/racket
sudo apt-get update
sudo apt-get install racket

# install Rosette
raco pkg install rosette

sudo apt-get install build-essential
pip install -U sexpdata
pip install -U z3-solver
git clone https://github.com/crytic/solc-select.git
./solc-select/scripts/install.sh
export PATH=/home/ju-ucsb/.solc-select:$PATH
source ~/.bashrc
solc use 0.4.25
pip install -U slither-analyzer

git clone https://github.com/fredfeng/LoopSummary.git
git checkout ase

rm -rf ./experiments/logs/*

raco exe ./src/rosette/bmc-rosette.rkt

screen -S size1_KLMN_600

./experiments/run_batch.sh 1 [AB] 600
./experiments/run_batch.sh 1 [CD] 600
./experiments/run_batch.sh 1 [EFGHIJ] 600
./experiments/run_batch.sh 1 [KLMN] 600
./experiments/run_batch.sh 1 [OPQR] 600
./experiments/run_batch.sh 1 [ST] 600
./experiments/run_batch.sh 1 [UVWXYZ] 600

./experiments/run_batch.sh 2 [A] 600
./experiments/run_batch.sh 2 [B] 600
./experiments/run_batch.sh 2 [C] 600
./experiments/run_batch.sh 2 [D] 600
./experiments/run_batch.sh 2 [EF] 600
./experiments/run_batch.sh 2 [G] 600
./experiments/run_batch.sh 2 [HIJK] 600
./experiments/run_batch.sh 2 [LM] 600
...(to be continued)

./experiments/run_batch.sh 3 [A] 900
./experiments/run_batch.sh 3 [BC] 900
./experiments/run_batch.sh 3 [DEF] 900
./experiments/run_batch.sh 3 [GHIJKL] 900
./experiments/run_batch.sh 3 [MNOPQ] 900
./experiments/run_batch.sh 3 [RS] 900

./experiments/run_batch.sh 3 [TU] 900
./experiments/run_batch.sh 3 [VWXYZ] 900
```

