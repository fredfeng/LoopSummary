import argparse
import os
import pickle
from sys import argv

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--folder", help="the folder that stores the benchmark solving logs", type=str)
    return parser.parse_args()

def get_functions(rstr):
    tmpstr = rstr.replace("(", "( ")
    tmplst = tmpstr.split(" ")
    ret = []
    for dtoken in tmplst:
        if dtoken.endswith("("):
            ret.append(dtoken.replace("(","").strip())
    return tuple(ret)

def main():    
    log_folders = ["./logs/log_0505cloud_size1_600/", "./logs/log_0507cloud_size2_7200/", "./logs/log_0507cloud_size3_7200/"]
    n_solved = 0
    construct_sts = {
        "complete": [],
        "partial": [], # (a, b, ...)
    }
    for ff in log_folders:
        log_files = os.listdir(ff)
        
        for dfile in log_files:
            log_path = os.path.join(ff, dfile)
            with open(log_path, "r") as f:
                raw_lines = f.readlines()
            raw_log = "".join(raw_lines)

            if "Solution found:" in raw_log:
                pp = None
                for target_line in raw_lines:
                    if "Solution found" in target_line:
                        pp = get_functions(target_line)
                        construct_sts["complete"].append(pp)
                        break
                print("# (complete) {}: {}".format(dfile, pp))
            elif "Partial summary found" in raw_log:
                pp = []
                for target_line in raw_lines:
                    if "Partial summary found" in target_line:
                        pp.append(get_functions(target_line))
                pp = tuple(pp)
                construct_sts["partial"].append(pp)
                print("# (partial) {}: {}".format(dfile, pp))
            else:
                print("# {}: solution not found.")

    with open("./construct_sts.pkl","wb") as f:
        pickle.dump(construct_sts, f)
        
if __name__ == '__main__':
    # assert len(argv) > 1
    # args = parse_args()    
    # main(args)
    main()