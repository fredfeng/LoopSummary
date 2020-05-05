import sys
import os
import re
import time
import subprocess 
import json
import copy

rosette_path = os.path.abspath(os.getcwd()) + '/rosette/bmc-rosette'

def check_eq(pfile1, pfile2, verbose=False):

    # input("CLICK-TO-EQ")

    # deepcopy first
    # inst_list, verify_list, authentic_read_list, authentic_write_list, loop_vars
    file1 = copy.deepcopy(pfile1)
    file2 = copy.deepcopy(pfile2)

    # verify_list checking
    if set(file1[1])!=set(file2[1]):
        return False

    # read_list checking
    if set(file1[2])!=set(file2[2]):
        return False

    # write_list checking
    if set(file1[3])!=set(file2[3]):
        return False

    # FIXME: don't check loop_vars since while loop won't have loop vars

    # sort the verify_list
    file1 = (file1[0], sorted(file1[1]))
    file2 = (file2[0], sorted(file2[1]))

    # program aware checkpoint naming
    # (notice)
    # CKPT is binary checkpoint that needs explicit if-else branch to assert
    # TNSF is integer checkpoint that needs uninterpreted function to evaluate
    # basically TNSF can be implemented in original bmc framework, but since it needs naming for alignment
    # I just pull it out as a new series
    for i in range(len(file1[0])):
        file1[0][i] = file1[0][i].replace("CKPT_","PROG1_CKPT_").replace("TNSF_","PROG1_TNSF_")
    for i in range(len(file1[1])):
        file1[1][i] = file1[1][i].replace("CKPT_","PROG1_CKPT_").replace("TNSF_","PROG1_TNSF_")
    for i in range(len(file2[0])):
        file2[0][i] = file2[0][i].replace("CKPT_","PROG2_CKPT_").replace("TNSF_","PROG2_TNSF_")
    for i in range(len(file2[1])):
        file2[1][i] = file2[1][i].replace("CKPT_","PROG2_CKPT_").replace("TNSF_","PROG2_TNSF_")

    # res = True
    inst_list1 = file1[0]
    write1 = file1[1]
    inst_list2 = file2[0]
    write2 = file2[1]
    if verbose:
        print('# File1 (candidate): ', inst_list1, write1)
        print('# File2 (source): ', inst_list2, write2)
    json_out = {"write1": write1, "insts1": inst_list1, "write2": write2, "insts2": inst_list2}
    json_out_str = json.dumps(json_out)
    if verbose:
        print("#### assembled json ####")
        print(json_out_str)

    # if len(file1[1])>1:
    #     input("DOUBLE CHECK BEFORE SENDING TO ROSETTE")

    output = subprocess.check_output([rosette_path, json_out_str]).decode('utf-8')
    # print('output from Rosette: ', output)
    # print('Rosette path: ', rosette_path)
    # assert False

    # return True

    eq_ret = None
    if "sat? = #t" in output:
        eq_ret = False
    elif "sat? = #f" in output:
        eq_ret = True
    else:
        raise NotImplementedError("Can't find valid output from Rosette, the original output is shown:\n{}".format(output))

    return eq_ret