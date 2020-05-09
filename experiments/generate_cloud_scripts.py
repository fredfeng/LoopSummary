import os
import time

main_folder = "../../LoopSummary.zip"
key_path = "~/.ssh/ju-ucsb"
user_name = "ju-ucsb"
benchmark_folder = "../examples/ase_benchmarks_regularized/{}/"
target_sizes = [1]
target_timeout = "7200"
machine_ips = [
	"13.64.193.227",
	"13.64.192.93",
	"13.64.193.107",
	"13.64.193.207",
	"13.64.192.51",
	"13.64.193.48",
	"13.64.193.119",
	"13.64.193.102",
	"40.78.80.149",
	"40.78.90.202",
	"13.64.193.147",
	"13.64.192.13",
	"13.64.192.211",
	"13.64.193.79",
	"13.64.192.121",
	"13.64.193.46",
	"13.64.199.10",
	"13.64.199.249",
	"13.64.192.34",
	"13.64.192.73",
	"13.64.192.36",
	"40.78.80.60",
	"13.64.193.116",
	"13.64.192.118",
	"40.78.84.152",
	"40.78.48.31",
	"13.64.192.71",
	"13.64.193.120",
	"104.210.48.123",
	"40.78.87.89",
	"40.78.84.120",
	"40.78.90.9",
	"104.210.50.128",
	"40.78.87.174",
	"104.40.0.111",
	"104.40.30.91",
	"138.91.247.222",
	"138.91.163.242",
	"157.56.164.186",
	"104.210.51.195",
	"40.118.189.113",
]
nb_per_thread = 3
nt_per_machine = 3
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
