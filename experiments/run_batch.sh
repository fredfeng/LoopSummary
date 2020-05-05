# run this script from the root directory of this project
size=$1;
prefix=$2;
timeout=$3
echo "# size=$size, prefix=$prefix, timeout=$timeout"
echo "# preparing to run size $size benchmarks..."
# echo "# compiling bmc-rosette..."
# raco exe ./src/rosette/bmc-rosette.rkt
current_date_time="`date +%Y%m%d%H%M%S`";
echo "# creating log folder: $size_$current_date_time"
mkdir ./experiments/logs
mkdir ./experiments/logs/log_size$size_$current_date_time
cd ./src/
echo "# running size $size benchmarks..."
for dir in ../examples/ase_benchmarks_regularized/$size/$prefix*; do
	filename=$(basename "$dir" ".sol")
	echo "# running benchmark $dir..."
	python ./bmc-synthesizer.py --file $dir > ../experiments/logs/log_$current_date_time/$filename.log --timeout $timeout 2>&1
done