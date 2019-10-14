"""
Takes in a cell x branch matrix and filters out branches
    with less than 30 samples. Search for 'min_n' if you want
    to change the minimum.

    python myscript.py -i /path/to/cxb.tab -o /path/to/filtered.cxb.tab
"""
import argparse
import sys
import pandas as pd


def parse_args():

    parser = argparse.ArgumentParser(description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)

    parser.add_argument('-i',"--in_file", type=str, help=""
                        )

    parser.add_argument('-o',"--out_file", type=str, help="",
                        )

    opts = parser.parse_args()
    in_file, out_file = opts.in_file, opts.out_file

    return in_file, out_file


def read_data(in_file):
    return pd.read_table(in_file, index_col=0)


def data_transform(data_obj):
    """Filter out branches having less than 30 samples."""
    min_n = 30
    return data_obj.iloc[:, ((~data_obj.isna()).sum() > min_n).tolist()]

def write_data(out_file, data_obj):
    if data_obj.shape[1] > 0:
        data_obj.to_csv(out_file, sep="\t")


def main():

    in_file, out_file = parse_args()

    data = read_data(in_file)

    new_data = data_transform(data)

    write_data(out_file, new_data)


if __name__ == "__main__":
    sys.exit(main())
