"""Plots from csv/times.csv and csv/waits.csv written by Main, saved to plots/."""
import csv
from collections import defaultdict
from pathlib import Path
from statistics import median

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import LogNorm

ROOT = Path(__file__).resolve().parent.parent
IMPLS = {
    "monitor": "monitor (synchronized)",
    "lock": "ReentrantLock, 2 warunki",
    "fair": "ReentrantLock, 4 warunki",
    "ticket": "4 warunki + kolejka biletowa",
}
# impl: (marker, color)
STYLE = {"monitor": ("o", "tab:blue"), "lock": ("^", "tab:red"), "fair": ("s", "tab:green"), "ticket": ("D", "tab:purple")}
WAIT_CONFIG = (1000, 16, 16)  # M, producers, consumers shown on the wait time plot

out = ROOT / "plots"
out.mkdir(exist_ok=True)
for stale in out.glob("*.png"):
    stale.unlink()

runs = defaultdict(list)
with open(ROOT / "csv" / "times.csv") as f:
    for r in csv.DictReader(f):
        key = r["impl"], int(r["M"]), int(r["producers"]), int(r["consumers"])
        runs[key].append((float(r["time_ms"]), float(r["jain_producers"]), float(r["jain_consumers"])))
times = {k: median(x[0] for x in v) for k, v in runs.items()}
jain = {k: median(min(x[1], x[2]) for x in v) for k, v in runs.items()}
portions = sorted({k[1] for k in times})
threads = sorted({k[2] for k in times})


def save(fig, name):
    fig.savefig(out / name, dpi=130, bbox_inches="tight")
    plt.close(fig)
    print("saved", out / name)


def per_threads(values, ylabel, name, log=False, worst=False):
    """One panel per M, x = number of producers = number of consumers."""
    fig, ax = plt.subplots(1, len(portions), figsize=(15, 4.4))
    for a, m in zip(ax, portions):
        if worst:
            a.plot(threads, [1 / t for t in threads], "--", color="gray", lw=1.0, label="1/k (pracuje jeden wątek)")
        for impl, label in IMPLS.items():
            marker, color = STYLE[impl]
            a.plot(threads, [values[impl, m, t, t] for t in threads], marker=marker, ms=4, lw=1.0, color=color, label=label)
        a.set_xscale("log", base=2)
        a.set_xticks(threads, [str(t) for t in threads])
        if log:
            a.set_yscale("log")
        a.set_xlabel("liczba producentów = liczba konsumentów")
        a.set_ylabel(ylabel)
        a.set_title(f"M = {m}", fontsize=10)
        a.grid(True, alpha=0.3)
    handles, labels = ax[0].get_legend_handles_labels()
    fig.legend(handles, labels, loc="lower center", ncol=len(labels), fontsize=9, bbox_to_anchor=(0.5, -0.06))
    fig.tight_layout()
    save(fig, name)


per_threads(times, "czas [ms]", "time_threads.png", log=True)
per_threads(jain, "indeks Jaina", "jain_threads.png", worst=True)

# heatmaps producers x consumers, one figure per M, shared logarithmic colour scale
for m in portions:
    grids = {impl: np.array([[times[impl, m, p, c] for c in threads] for p in threads]) for impl in IMPLS}
    norm = LogNorm(min(g.min() for g in grids.values()), max(g.max() for g in grids.values()))
    fig, ax = plt.subplots(1, len(IMPLS), figsize=(18, 4.6))
    for a, (impl, label) in zip(ax, IMPLS.items()):
        im = a.imshow(grids[impl], origin="lower", cmap="viridis", norm=norm)
        for i in range(len(threads)):
            for j in range(len(threads)):
                v = grids[impl][i, j]
                a.text(j, i, f"{v:.0f}", ha="center", va="center", fontsize=6.5,
                       color="white" if norm(v) < 0.6 else "black")
        a.set_xticks(range(len(threads)), threads)
        a.set_yticks(range(len(threads)), threads)
        a.set_xlabel("liczba konsumentów")
        a.set_ylabel("liczba producentów")
        a.set_title(label, fontsize=10)
    fig.colorbar(im, ax=ax, label="czas [ms]", shrink=0.9)
    fig.suptitle(f"M = {m}", fontsize=11)
    save(fig, f"heatmap_{m}.png")

# mean time of one put/take call against portion size
waits = defaultdict(list)
with open(ROOT / "csv" / "waits.csv") as f:
    for r in csv.DictReader(f):
        if (int(r["M"]), int(r["producers"]), int(r["consumers"])) == WAIT_CONFIG:
            mid = (int(r["portion_lo"]) + int(r["portion_hi"])) / 2
            waits[r["impl"], r["role"]].append((mid, float(r["mean_us"])))
fig, ax = plt.subplots(1, 2, figsize=(13, 4.4))
for a, (role, role_label) in zip(ax, [("producer", "producenci, put"), ("consumer", "konsumenci, take")]):
    for impl, label in IMPLS.items():
        marker, color = STYLE[impl]
        pts = sorted(waits[impl, role])
        a.plot([p[0] for p in pts], [p[1] for p in pts], marker=marker, ms=4, lw=1.0, color=color, label=label)
    a.set_yscale("log")
    a.set_xlabel("wielkość porcji")
    a.set_ylabel("średni czas wywołania [µs]")
    a.set_title(role_label, fontsize=10)
    a.grid(True, alpha=0.3)
    a.legend(fontsize=8)
fig.suptitle(f"M = {WAIT_CONFIG[0]}, {WAIT_CONFIG[1]} producentów, {WAIT_CONFIG[2]} konsumentów", fontsize=11)
fig.tight_layout()
save(fig, "waits.png")
