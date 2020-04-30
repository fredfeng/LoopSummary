# Loop Summarization for Smart Contracts

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

```bash
python ./bmc-synthesizer.py --file <your_benchmark> --prune
```

### Bounded Model Checker

You can also debug the bounded model checker by:

```bash
cd ./src/rosette
racket ./bmc-rosette.rkt '<json_intermediate_ir>'
```