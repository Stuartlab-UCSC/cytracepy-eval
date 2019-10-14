"""
"""
import argparse
import sys
import pandas as pd
import numpy as np
import os
from scipy.stats import spearmanr


def parse_args():

    parser = argparse.ArgumentParser(description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)

    parser.add_argument('-c1',"--cxb1", type=str, help=""
                        )

    parser.add_argument('-c2',"--cxb2", type=str, help=""
                        )

    parser.add_argument('-e1', "--entry", type=str, help=""
                       )
    parser.add_argument('-e2', "--entry2", type=str, help="algorithm type"
                       )
    parser.add_argument('-o',"--out_file", type=str, help="",
                        required=True
                        )

    opts = parser.parse_args()
    cxb1, cxb2, entry, entry2, out_file = opts.cxb1, opts.cxb2, opts.entry, opts.entry2, opts.out_file

    return cxb1, cxb2, entry, entry2, out_file


def read_data(cxb1, cxb2):
    return pd.read_table(cxb1, index_col=0), pd.read_table(cxb2, index_col=0)


def in_common(series1, series2):
    return set(series1.dropna().index).intersection(series2.dropna().index)


def data_transform(cxb1, cxb2, entry, entry2, trajid):
    all_data = []
    for branch1 in cxb1.columns:
        for branch2 in cxb2.columns:
            series1, series2 = cxb1[branch1], cxb2[branch2]
            common_s = in_common(series1, series2)
            series1, series2 = series1.loc[common_s], series2.loc[common_s]
            if len(common_s) > 5:
                spr = spearmanr(series1, series2)
                corr = spr.correlation
                pval = spr.pvalue
            else:
                corr = np.nan
                pval = np.nan
            all_data += [[trajid, branch1, branch2, len(cxb1[branch1].dropna()), len(cxb2[branch2].dropna()),
                          len(common_s), corr, entry, entry2, pval]]

        return pd.DataFrame(
            all_data,
            columns=["traj-id", "first-branch", "second-branch", "first-n", "second-n", "intersection-n", "spearmanr",
                     "same-diff", "algorithm", "pval"]
        )


def write_data(out_file, df):

    if not os.path.isfile(out_file):
        df.to_csv(out_file, sep="\t", index=False)
    else:
        df.to_csv(out_file, mode='a', header=False, sep="\t", index=False)

def main():

    cxb1, cxb2, entry, entry2, out_file = parse_args()

    trajsimid = cxb1 + "--" + cxb2 + entry2
    cxb1, cxb2 = read_data(cxb1, cxb2)

    new_data = data_transform(cxb1, cxb2, entry, entry2, trajsimid)

    write_data(out_file, new_data)


if __name__ == "__main__":
    sys.exit(main())
