#!/usr/bin/env python

import re
import argparse

def get_args():
    parser = argparse.ArgumentParser(description="A program to parse SAM file and determined number of mapped and unmapped reads")
    parser.add_argument('-f', '--filename', help='SAM file to parse through', required=True)
    return parser.parse_args()

args = get_args()
file = args.filename
#initialize count variables
map_count = 0 
non_map_count = 0
#open SAM file
with open(file, 'r') as input: 
    for line in input: 
        #if not a header line
        if not line.startswith("@"):
            #search for bitwise flag and capture  it in match group
            m = re.search(r'[^\t\n\r]+\t([0-9]+)', line)
            flag = int(m.group(1))
            # if this is not a secondary aligment
            if((flag & 256) != 256):
                #if segment is mapped 
                if((flag & 4) != 4): 
                    mapped = True
                    #increment count of mapped reads
                    map_count+=1
                else: 
                    #increment count of unmapped reads
                    non_map_count += 1
#Print out respective counts
print(f'Mapped Reads: {map_count}')
print(f'Nonmapped Reads: {non_map_count}')