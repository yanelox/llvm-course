import numpy as np
import matplotlib.pyplot as plt
import argparse

parser = argparse.ArgumentParser(
                    prog='graph',
                    description='Generate a graph')

parser.add_argument('filename')
args = parser.parse_args()

instr_names = []
instr_count = []

with open(args.filename) as file:
    for line in file:
        instr_names.append(line.split()[0])
        instr_count.append(int(line.split()[1]))

instr_names = np.array(instr_names)[np.argsort(instr_count)]
instr_count = np.sort(np.array(instr_count))

fig = plt.figure(figsize=(20, 20))
ax = fig.add_subplot()

ax.bar(instr_names, instr_count)
ax.grid()

plt.savefig('stat.png')
