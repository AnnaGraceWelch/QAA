#!/usr/bin/env python

import argparse
import matplotlib.pyplot as plt
import gzip

def get_args():
    parser = argparse.ArgumentParser(description="Program to retain only reciprocal best hits")
    parser.add_argument("-r1", "--trimmed_read1", help="First trimmed reads file from read1 output from trimmomatic", required=True)
    #parser.add_argument('-r1u', '--trimmed_unread1', help="unpaired trimmed reads from read1 output from trimmomatic", required=True)
    parser.add_argument('-r2', '--trimmed_read2', help='First trimmed reads file from read2 output from trimmomatic', required=True)
    #parser.add_argument('-r2u', '--trimmed_unread2', help='unpaired trimmed reads from read2 output from trimmomatic', required=True)
    parser.add_argument('-o1', '--output1', help='tsv file to write read1 distribution to', required=True)
    parser.add_argument('-o2', '--output2', help='tsv file to write read2 distribution to', required=True)
    parser.add_argument('-o3', '--output3', help='name of plot with R1 and R2 read distributions')
    return parser.parse_args()

args = get_args()
def read_len_dist(fh):
    lengths = {}
    list_lengths = []
    with gzip.open(fh) as input:
        i = 0
        for line in input: 
            line = line.strip()
            if i % 4 == 1:
                list_lengths.append(len(line))
                if len(line) in lengths:
                    lengths[len(line)] += 1
                else:
                    lengths[len(line)] = 1
                i += 1
            else: 
                i += 1
                continue
    return lengths, list_lengths

read1_lens, list_len1 = read_len_dist(args.trimmed_read1)
with open(args.output1, 'w') as output1:
    output1.write(f'Read Length\tFrequency\n')
    for key in read1_lens:
        output1.write(f'{key}\t{read1_lens[key]}\n') 

read2_lens, list_len2 = read_len_dist(args.trimmed_read2)
with open(args.output2, 'w') as output2:
    output2.write(f'Read Length\tFrequency\n')
    for key in read2_lens:
        output2.write(f'{key}\t{read2_lens[key]}\n')




# plt.bar(list(read1_lens.keys()), read1_lens.values(), color='blue')
# plt.bar(list(read2_lens.keys()), read2_lens.values(), color='red')
plt.hist([list_len1, list_len2], alpha = 0.5, color=["blue","red"], label=["R1", "R2"])
plt.xlabel("Read Lengths")
plt.legend()
plt.yscale("log")
plt.ylabel('Frequency')
plt.title("Read Length Distribution")
plt.savefig(f'{args.output3}.png') 
                

