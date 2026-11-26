"""Plots from csv/*.csv written by Main, saved to plots/; prints the numbers used in the report."""
import csv
from collections import defaultdict
from pathlib import Path
from statistics import median

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

ROOT = Path(__file__).resolve().parent.parent
out = ROOT / "plots"
out.mkdir(exist_ok=True)
for stale in out.glob("*.png"):
    stale.unlink()

LABEL = {"single": "single", "fixed": "fixed", "cached": "cached", "workstealing": "work-stealing",
         "virtual": "virtual", "sequential": "sekwencyjnie"}
COLOR = {"single": "tab:gray", "fixed": "tab:blue", "cached": "tab:green", "workstealing": "tab:red",
         "virtual": "tab:purple", "sequential": "black"}


def read(name):
    with open(ROOT / "csv" / name) as f:
        return list(csv.DictReader(f))


# ---------- scaling
runs, pools = defaultdict(list), defaultdict(list)
for r in read("times.csv"):
    if r["experiment"] != "scaling":
        continue
    k = (r["executor"], int(r["threads"]), int(r["max_iter"]))
    runs[k].append(float(r["time_ms"]))
    pools[k].append(int(r["pool_size"]))
t = {k: median(v) for k, v in runs.items()}
iters = sorted({k[2] for k in t})
threads = sorted({k[1] for k in t if k[0] == "fixed"})
seq = {it: t["sequential", 1, it] for it in iters}

fig, axs = plt.subplots(2, 3, figsize=(13, 7.2), sharey=False)
ax = axs.ravel()
for a, it in zip(ax, iters):
    for ex in ("fixed", "workstealing"):
        a.plot(threads, [t[ex, n, it] for n in threads], "-o", ms=4, lw=1.2, color=COLOR[ex], label=LABEL[ex])
    for ex in ("single", "cached", "virtual", "sequential"):
        a.axhline(t[ex, 1, it], ls="--" if ex != "sequential" else ":", lw=1.1, color=COLOR[ex], label=LABEL[ex])
    a.set_xticks(threads, [str(n) for n in threads], fontsize=8)
    a.set_yscale("log")
    a.set_xlabel("liczba wątków")
    a.set_ylabel("czas [ms]")
    a.set_title(f"MAX_ITER = {it}", fontsize=10)
    a.grid(True, alpha=0.3)
h, l = ax[0].get_legend_handles_labels()
ax[5].axis("off")
ax[5].legend(h, l, loc="center", fontsize=11, frameon=False)
fig.tight_layout()
fig.savefig(out / "times.png", dpi=130, bbox_inches="tight")
plt.close(fig)

fig, ax = plt.subplots(1, 2, figsize=(11, 3.8), sharey=True)
cmap = plt.get_cmap("viridis")
for a, ex in zip(ax, ("fixed", "workstealing")):
    for i, it in enumerate(iters):
        a.plot(threads, [seq[it] / t[ex, n, it] for n in threads], "-o", ms=4, lw=1.2, color=cmap(i / (len(iters) - 1)),
               label=f"MAX_ITER = {it}")
    a.plot(threads, threads, ":", color="black", label="idealnie")
    a.axvline(4, color="gray", lw=0.6, ls="--")
    a.axvline(10, color="gray", lw=0.6, ls="--")
    a.set_xticks(threads, [str(n) for n in threads], fontsize=8)
    a.set_xlabel("liczba wątków")
    a.set_ylabel("przyspieszenie względem wersji sekwencyjnej")
    a.set_title(LABEL[ex], fontsize=10)
    a.grid(True, alpha=0.3)
ax[0].legend(fontsize=8)
fig.tight_layout()
fig.savefig(out / "speedup.png", dpi=130, bbox_inches="tight")
plt.close(fig)

print("== sekwencyjnie [ms]:", {it: round(seq[it], 1) for it in iters})
print("== czas [ms]: executor n | MAX_ITER", iters)
for ex in ("single", "fixed", "cached", "workstealing", "virtual"):
    for n in (threads if ex in ("fixed", "workstealing") else [1]):
        print(f"{ex:13s} n={n:<2}", " ".join(f"{t[ex, n, it]:8.1f}" for it in iters))
print("== speedup")
for ex in ("single", "fixed", "cached", "workstealing", "virtual"):
    for n in (threads if ex in ("fixed", "workstealing") else [1]):
        print(f"{ex:13s} n={n:<2}", " ".join(f"{seq[it] / t[ex, n, it]:6.2f}" for it in iters))
print("== efficiency S/n (fixed, ws)")
for ex in ("fixed", "workstealing"):
    for n in threads:
        print(f"{ex:13s} n={n:<2}", " ".join(f"{seq[it] / t[ex, n, it] / n:6.2f}" for it in iters))
print("== cached largest pool size (median)", {it: median(pools["cached", 1, it]) for it in iters})
print("== best config per executor and MAX_ITER (time ms, n)")
for ex in ("fixed", "workstealing"):
    for it in iters:
        n = min(threads, key=lambda n: t[ex, n, it])
        print(f"{ex:13s} it={it:<6} best n={n:<2} {t[ex, n, it]:8.1f} ms  speedup {seq[it] / t[ex, n, it]:5.2f}")

# ---------- granularity
g = defaultdict(list)
for r in read("times.csv"):
    if r["experiment"] == "granularity":
        g[r["executor"], int(r["threads"]), r["shape"]].append(float(r["time_ms"]))
g = {k: median(v) for k, v in g.items()}
shapes = []
for r in read("times.csv"):
    if r["experiment"] == "granularity" and r["shape"] not in shapes:
        shapes.append(r["shape"])
gthreads = sorted({k[1] for k in g})
SHAPE_LABEL = {"rows:1": "1 wiersz", "rows:4": "4 wiersze", "rows:16": "16 wierszy", "rows:64": "64 wiersze",
               "tile:8": "kafelki 8×8", "tile:32": "kafelki 32×32", "perthread": "1 blok/wątek"}
ntasks = {"rows:1": 600, "rows:4": 150, "rows:16": 38, "rows:64": 10, "tile:8": 7500, "tile:32": 475}
fig, ax = plt.subplots(1, len(gthreads), figsize=(11, 3.9), sharey=True)
w = 0.38
for a, n in zip(ax, gthreads):
    x = np.arange(len(shapes))
    for j, ex in enumerate(("fixed", "workstealing")):
        a.bar(x + (j - 0.5) * w, [g[ex, n, s] for s in shapes], w, color=COLOR[ex], label=LABEL[ex])
    a.set_xticks(x, [SHAPE_LABEL[s] for s in shapes], rotation=30, ha="right", fontsize=8)
    a.set_title(f"{n} wątków, MAX_ITER = 2000", fontsize=10)
    a.grid(True, axis="y", alpha=0.3)
ax[0].set_ylabel("czas [ms]")
ax[0].legend(fontsize=8)
fig.tight_layout()
fig.savefig(out / "granularity.png", dpi=130, bbox_inches="tight")
plt.close(fig)
print("== granularity [ms]: executor n shape")
for ex in ("fixed", "workstealing"):
    for n in gthreads:
        print(f"{ex:13s} n={n:<2}", " ".join(f"{s}={g[ex, n, s]:.1f}" for s in shapes))

# ---------- load
L = defaultdict(lambda: defaultdict(list))
for r in read("load.csv"):
    for m in ("wall_ms", "jain", "max_over_mean"):
        L[r["executor"], r["shape"]][m].append(float(r[m]))
lshapes = ["perthread", "rows:16", "rows:1"]
busy = defaultdict(list)
for r in read("loadthreads.csv"):
    busy[r["executor"], r["shape"]].append(float(r["busy_ms"]))
fig, ax = plt.subplots(1, 3, figsize=(13, 3.6), sharey=True)
for a, s in zip(ax, lshapes):
    x = np.arange(10)
    for j, ex in enumerate(("fixed", "workstealing")):
        a.bar(x + (j - 0.5) * w, busy[ex, s], w, color=COLOR[ex], label=LABEL[ex])
    a.set_xticks(x, [str(i + 1) for i in x])
    a.set_xlabel("wątek (posortowane malejąco)")
    a.set_title(SHAPE_LABEL[s], fontsize=10)
    a.grid(True, axis="y", alpha=0.3)
ax[0].set_ylabel("czas pracy wątku [ms]")
ax[0].legend(fontsize=8)
fig.tight_layout()
fig.savefig(out / "load.png", dpi=130, bbox_inches="tight")
plt.close(fig)
print("== load (10 wątków, MAX_ITER=2000): executor shape wall_ms jain max/mean")
for ex in ("fixed", "workstealing"):
    for s in lshapes:
        d = L[ex, s]
        print(f"{ex:13s} {s:10s} wall={median(d['wall_ms']):7.1f} J={median(d['jain']):.3f} max/mean={median(d['max_over_mean']):.2f}")
print("saved", *sorted(p.name for p in out.glob("*.png")))
