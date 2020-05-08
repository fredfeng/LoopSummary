import argparse
import os
from sys import argv

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--folder", help="the folder that stores the benchmark solving logs", type=str)
    return parser.parse_args()

def main(args):    
    log_folder = args.folder
    log_files = os.listdir(log_folder)
    n_solved = 0
    n_solved_partial = {0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0}
    solved_constructs = {
        "SUM": 0
    }
    n_timeout = 0
    n_exhausted = 0
    n_failed = 0
    for dfile in log_files:
        log_path = os.path.join(log_folder, dfile)
        with open(log_path, "r") as f:
            raw_log = f.read()
        if "Solution found:" in raw_log:
            n_solved += 1
            st = raw_log.index("Total Time: ")
            ed = raw_log.index("s",st)
            t = raw_log[st+12:ed]
            print("# {}, solved: {}s".format(dfile, t))
        else:
            pn = raw_log.count("Partial summary found")
            n_solved_partial[pn] += 1
            if "Timeout." in raw_log:
                n_timeout += 1
                print("# {}, timeout.".format(dfile))
            elif "Enumerator is exhausted" in raw_log:
                n_exhausted += 1
                print("# {}, exhausted.".format(dfile))
            else:
                n_failed += 1
                print("# {}, failed.".format(dfile))
    print("# ====== statistics ====== #")
    print("# total                  : {}".format(len(log_files)))
    print("  |- solved              : {}, {:.4f}".format(n_solved, n_solved/len(log_files)))
    # print("# timeout        : {}".format(n_timeout))
    # print("# failed         : {}".format(n_failed))
    # print("# exhausted      : {}".format(n_exhausted))
    # print("# success rate   : {:.4f}".format(n_solved/len(log_files)))
    print("  |- unsolved            :")
    print("     |- can't solve any  : {}, {:.4f}".format( n_solved_partial[0], n_solved_partial[0]/len(log_files) ))
    tmp_ps = [n_solved_partial[dkey] for dkey in n_solved_partial.keys() if dkey>0 and n_solved_partial[dkey]>0]
    print("     |- partially solved : {}, {:.4f}".format( sum(tmp_ps), sum(tmp_ps)/len(log_files) ))
    for dkey in n_solved_partial.keys():
        if dkey>0 and n_solved_partial[dkey]>0:
            print("          {} -> {}, {:.4f}".format(dkey, n_solved_partial[dkey], n_solved_partial[dkey]/len(log_files)))

if __name__ == '__main__':
    assert len(argv) > 1
    args = parse_args()    
    main(args)