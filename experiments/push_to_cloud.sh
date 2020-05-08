ssh -i ~/.ssh/ju-ucsb ju-ucsb@23.100.40.248 /bin/bash << EOF
cd ./LoopSummary/
screen -dmS size2_A
screen -S size2_A -p 0 -X stuff './experiments/run_batch.sh 2 [A] 900\n'
exit
EOF