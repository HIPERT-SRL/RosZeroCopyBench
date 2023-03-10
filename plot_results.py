import os
import numpy as np
import matplotlib.pyplot as plt

dds=["cyclone", "fast"]

for d in dds:
    res_dir = "results_" + d
    files = os.listdir(res_dir)

    results = {}
    for fpath in files:
        f = open(os.path.join(res_dir,fpath), "r")
        times = []
        for l in f.readlines():
            if("Latency" in l):
                vals = l.split(" ")
                times.append(float(vals[4]))
        results[fpath.split(".")[0]] = times


    for k in results.keys():
        k = k.split(".")[0]
        style = '-'
        if(k[0] == 'd'):
            style = '--'
        plt.plot(results[k], style, label=k)
    plt.legend(loc="upper left")
    plt.xlabel('sample')
    plt.ylabel('latency (ms)')
    plt.title("ros2 " + str(d) + " latency")
    plt.savefig('results' + str(d) + '.pdf')
    plt.savefig('results' + str(d) + '.png', dpi=300)
    plt.show()
