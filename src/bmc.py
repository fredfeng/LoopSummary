import sys
import os
import re
import time
import subprocess 
import json

rosette_path = os.path.abspath(os.getcwd()) + '/rosette/bmc-rosette'

def check_eq(file1, file2):
    # res = True
    inst_list1 = file1[0]
    write1 = file1[1]
    inst_list2 = file2[0]
    # FIXME: could be multiple vairables in general.
    write2 = file2[1][0]
    print('File1: ', inst_list1, write1)
    print('File2: ', inst_list2, write2)
    json_out = {"write1": write1, "insts1": inst_list1, "write2": write2, "insts2": inst_list2}
    json_out_str = json.dumps(json_out)
    print(json_out_str)

    output = subprocess.check_output([rosette_path, json_out_str])
    print('output from Rosette: ', output)
    print(rosette_path)
    assert False

    return True