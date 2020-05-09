import os
import time

main_folder = "../../LoopSummary.zip"
key_path = "~/.ssh/ju-ucsb"
user_name = "ju-ucsb"
benchmark_folder = "../examples/ase_benchmarks_regularized/{}/"
target_sizes = [5,6,7,8,9,10,11,13]
target_timeout = "7200"
machine_ips = [
	"23.100.33.67",
	"23.101.201.156",
	"23.101.200.242",
	"23.101.200.231",
	"23.100.35.214",
	"23.101.200.172",
	"23.100.35.42",
	"23.100.35.6",
	"23.100.35.116",
	"23.100.35.149",
	"23.101.201.139",
	"23.101.201.37",
	"23.100.41.228",
	"23.101.200.46",
	"23.100.41.27",
	"23.101.200.202",
	"23.101.201.130",
	"23.100.43.206",
	"23.100.42.62",
	"23.101.201.179",
	"23.100.34.184",
	"23.100.36.189",
	"23.101.200.104",
	"23.101.201.155",
	"23.101.200.183",
	"23.100.35.60",
	"23.100.39.230",
	"23.101.200.211",
	"23.100.35.168",
	"23.100.41.243",
	"23.100.40.205",
	"23.100.34.244",
	"23.100.43.232",
	"23.101.200.185",
	"23.100.42.58",
	"23.100.47.156",
]
nb_per_thread = 1
nt_per_machine = 6
all_benchmarks = []
for p in target_sizes:
	tmp_list = os.listdir(benchmark_folder.format(p))
	# group by nb_per_thread
	grp_list = [tmp_list[u:u+nb_per_thread] for u in range(0,len(tmp_list),nb_per_thread)]
	all_benchmarks += [(p,grp_list[x]) for x in range(len(grp_list))]



script_delete = """# This script deletes the existing ./LoopSummary folder on cloud machines.
# The script is automatically generated.
"""
cell_delete = """

echo "# cleaning {}...\n"
ssh -i {} {}@{} /bin/bash << EOF
sudo rm -rf ./LoopSummary
sudo rm -rf ./LoopSummary.zip
sudo rm -rf ./__MACOSX
exit
EOF

"""
for my_ip in machine_ips:
	script_delete += cell_delete.format( key_path, key_path, user_name, my_ip )
with open("./cloud_delete.sh","w") as f:
	f.write(script_delete)



script_upload = """# This script uploads the specific folder to cloud machines.
# The script is automatically generated.
"""
cell_upload = """

echo "# uploading {}...\n"
scp -r -i {} {} {}@{}:./

"""
for my_ip in machine_ips:
	script_upload += cell_upload.format( main_folder, key_path, main_folder, user_name, my_ip )
with open("./cloud_upload.sh","w") as f:
	f.write(script_upload)



script_execute = """# This script compiles the rosette executable and run benchmarks.
# The script is automatically generated.
"""
cell_execute = """

ssh -i {} {}@{} /bin/bash << EOF
sudo apt-get -y install unzip
unzip ./LoopSummary.zip
cd ./LoopSummary/
raco exe ./src/rosette/bmc-rosette.rkt

{}

EOF

"""
cell_sc = """

screen -dmS size{}_{}
screen -S size{}_{} -p 0 -X stuff './experiments/run_batch_list.sh {} {} {}\\n'

"""
list_sc = []
for j in range(len(all_benchmarks)):
	q = all_benchmarks[j]
	t = time.time()
	list_sc.append(
		cell_sc.format( q[0], t, q[0], t, q[0], '"{}"'.format(" ".join(q[1])), target_timeout )
	)
# group again
list_gc = [list_sc[u:u+nt_per_machine] for u in range(0,len(list_sc),nt_per_machine)]
tmp2 = ""
for i in range(len(machine_ips)):
	# assume the ip is enough
	if i >= len(list_gc):
		break
	tmp0 = "".join(list_gc[i])
	tmp1 = cell_execute.format(key_path, user_name, machine_ips[i], tmp0)
	tmp2 += tmp1
with open("./cloud_execute.sh","w") as f:
	f.write(tmp2)


script_download = """

"""
cell_download = """

scp -r -i {} {}@{}:./LoopSummary/experiments/logs/log_size*/ ./logs/

"""
for i in range(len(machine_ips)):
	script_download += cell_download.format(key_path, user_name, machine_ips[i])
with open("./cloud_download.sh","w") as f:
	f.write(script_download)
