import numpy as np
import matplotlib.pyplot as plt
import argparse

parser = argparse.ArgumentParser(
                    prog='graph',
                    description='Generate a graph')

parser.add_argument('filename')
args = parser.parse_args()

instr = {}
instr_pairs = {}
instr_three = {}
opcodes = {}

fig, ax = plt.subplots(3, figsize=(20, 40))

ax[0].xaxis.set_tick_params(rotation=90)
ax[1].xaxis.set_tick_params(rotation=90)
ax[2].xaxis.set_tick_params(rotation=90)


with open(args.filename) as file:
    first = file.readline().strip()
    second = file.readline().strip()

    for third in file:
        third = third.strip()
        if (third == "OPCODES_COUNT"):
            break

        if (instr_pairs.get(first + ":" + second, None)):
            instr_pairs[first + ":" + second] += 1
        else:
            instr_pairs[first + ":" + second] = 1

        if(instr_three.get(first + ":" + second + ":" + third, None)):
            instr_three[first + ":" + second + ":" + third] += 1
        else:
            instr_three[first + ":" + second + ":" + third] = 1

        first = second
        second = third

    for line in file:
        if (line == "OPCODES\n"):
            break

        instr[line.split()[0]] = int(line.split()[1])

    for line in file:
        opcodes[line.split()[1]] = line.split()[0]

x = list(map(lambda x: x[1], sorted(opcodes.items(), key=lambda x: x[0])))
y = list(map(lambda x: x[1], sorted(instr.items(), key=lambda x: x[0])))
data = dict(sorted(zip(x, y), key=lambda x: x[1], reverse=True))
ax[0].bar(data.keys(), data.values())

data = dict(map(lambda x: [opcodes[x[0].split(":")[0]] + " & " + opcodes[x[0].split(":")[1]], x[1]], instr_pairs.items()))
data_median = np.median(list(data.values()))
data = dict(filter(lambda x: x[1] > data_median, data.items()))
data = dict(sorted(data.items(), key=lambda x: x[1], reverse=True))
ax[1].bar(data.keys(), data.values())

data = dict(map(lambda x:[opcodes[x[0].split(":")[0]] + " & " + opcodes[x[0].split(":")[1]] + " & " + opcodes[x[0].split(":")[2]], x[1]], instr_three.items()))
data_median = np.median(list(data.values()))
data = dict(filter(lambda x: x[1] > data_median, data.items()))
data = dict(sorted(data.items(), key=lambda x: x[1], reverse=True))
ax[2].bar(data.keys(), data.values())

plt.savefig('stat.png')
