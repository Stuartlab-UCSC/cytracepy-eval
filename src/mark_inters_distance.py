"""CLI to dist.trajectory

example:
    python3 -m cytracepy -h
    
Currently only appends the distance to -o --outfile file.
"""
import sys
from cytracepy import dist
from cytracepy import io
import argparse
import sys

def parse_args():

    parser = argparse.ArgumentParser(description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)

    parser.add_argument('-cf',"--cxb_focus", type=str, help="")

    parser.add_argument('-cq',"--cxb_query", type=str, help="")

    parser.add_argument('-ff',"--feat_focus", type=str, help="")

    parser.add_argument('-fq',"--feat_query", type=str, help="")

    parser.add_argument('-m',"--marker_gmt", type=str, help="")

    parser.add_argument('-o',"--outfile", type=str,help="",
                        required=True)


    parser.add_argument('-e1',"--entry1", type=str,help="",
                        required=True)

    parser.add_argument('-e2',"--entry2", type=str,help="",
                        required=True)

    args = parser.parse_args()
    return args.cxb_focus, args.cxb_query, args.feat_focus, args.feat_query, args.marker_gmt, args.outfile, args.entry1, args.entry2

def main():

    focus_cxb, query_cxb, focus_mat, query_mat, markers, outfile, same_algorithm, same_data = parse_args()
    query_id = "%s--%s"%(focus_mat, query_mat)

    focus_cxb = io.read_cell_x_branch(focus_cxb)
    query_cxb = io.read_cell_x_branch(query_cxb)
    focus_mat = io.read_feature_matrix(focus_mat)
    query_mat = io.read_feature_matrix(query_mat)
    markers = io.read_markers(markers)

    distance = dist.trajectory(
         focus_mat, query_mat,
         focus_cxb, query_cxb,
         markers
    )  


    n_genes_in_calc = []
    n_genes_in_markers = []
    for branch in markers.keys():
        n_genes_in_calc += [len(set(markers[branch]).intersection(query_mat.columns))]
        n_genes_in_markers += [len(markers[branch])]

    import numpy as np
    with open(outfile, "a") as fout:
        fout.write("%f\t%f\t%f\t%d\t%s\t%s\t%s\n"%(distance, np.min(n_genes_in_markers), np.min(n_genes_in_calc), len(markers.keys()), same_algorithm, same_data, query_id))
    
if __name__ == "__main__":
    sys.exit(main())

