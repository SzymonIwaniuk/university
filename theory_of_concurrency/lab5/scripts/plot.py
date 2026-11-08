"""Plots from csv/runs.csv, csv/deadlock.csv and csv/starvation.csv written by Main, saved to plots/."""
import csv
from collections import defaultdict
from pathlib import Path
from statistics import mean, median

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

ROOT = Path(__file__).resolve().parent.parent
IMPLS = {
    "both": "b) oba widelce naraz",
    "waiter": "c) lokaj",
    "asym": "asymetryczne (autorskie)",
}
STYLE = {"both": ("o", "tab:blue"), "waiter": ("s", "tab:green"), "asym": ("D", "tab:purple")}
SCENARIOS = {
    "0/0": "bez myślenia i jedzenia",
    "0/1": "myślenie 0 ms, jedzenie 1 ms",
    "1/1": "myślenie 1 ms, jedzenie 1 ms",
    "10/1": "myślenie 10 ms, jedzenie 1 ms",
}

out = ROOT / "plots"
out.mkdir(exist_ok=True)
for stale in out.glob("*.png"):
    stale.unlink()


def save(fig, name):
    fig.savefig(out / name, dpi=130, bbox_inches="tight")
    plt.close(fig)
    print("saved", out / name)


runs = defaultdict(list)
with open(ROOT / "csv" / "runs.csv") as f:
    for r in csv.DictReader(f):
        runs[r["impl"], r["scenario"], int(r["n"])].append(r)
sizes = sorted({k[2] for k in runs})


def med(impl, s, n, col):
    return median(float(r[col]) for r in runs[impl, s, n])


def per_n(col, ylabel, name, log=False, worst=False):
    """One panel per scenario, x = number of philosophers."""
    fig, ax = plt.subplots(1, len(SCENARIOS), figsize=(17, 4.2))
    for a, (s, title) in zip(ax, SCENARIOS.items()):
        if worst:
            a.plot(sizes, [1 / n for n in sizes], "--", color="gray", lw=1.0, label="1/n (je jeden filozof)")
        for impl, label in IMPLS.items():
            marker, color = STYLE[impl]
            a.plot(sizes, [med(impl, s, n, col) for n in sizes], marker=marker, ms=4, lw=1.0, color=color, label=label)
        a.set_xscale("log")
        a.set_xticks(sizes, [str(n) for n in sizes])
        a.minorticks_off()
        if log:
            a.set_yscale("log")
        a.set_xlabel("liczba filozofów n")
        a.set_ylabel(ylabel)
        a.set_title(title, fontsize=10)
        a.grid(True, alpha=0.3)
    handles, labels = ax[0].get_legend_handles_labels()
    fig.legend(handles, labels, loc="lower center", ncol=len(labels), fontsize=9, bbox_to_anchor=(0.5, -0.07))
    fig.tight_layout()
    save(fig, name)


per_n("throughput", "posiłki na sekundę", "throughput.png", log=True)
per_n("mean_wait_us", "średni czas oczekiwania [µs]", "wait_mean.png", log=True)
per_n("max_wait_us", "maks. czas oczekiwania [µs]", "wait_max.png", log=True)
per_n("jain", "indeks Jaina posiłków", "jain.png", worst=True)

# naive solution: time until deadlock
dead = defaultdict(list)
with open(ROOT / "csv" / "deadlock.csv") as f:
    for r in csv.DictReader(f):
        dead[r["scenario"], int(r["n"])].append((int(r["deadlock"]), float(r["time_ms"]), int(r["meals"])))
dsizes = sorted({k[1] for k in dead})
fig, ax = plt.subplots(1, 2, figsize=(13, 4.4))
colors = dict(zip(SCENARIOS, ["tab:red", "tab:orange", "tab:green", "tab:blue"]))
for i, (s, title) in enumerate(SCENARIOS.items()):
    xs = np.arange(len(dsizes)) + (i - 1.5) * 0.18
    for x, n in zip(xs, dsizes):
        pts = [t for d, t, _ in dead[s, n] if d]
        ax[0].scatter([x] * len(pts), pts, s=9, color=colors[s], alpha=0.6, label=title if n == dsizes[0] else None)
    ax[1].bar(xs, [100 * mean(d for d, _, _ in dead[s, n]) for n in dsizes], width=0.17, color=colors[s], label=title)
for a in ax:
    a.set_xticks(range(len(dsizes)), [str(n) for n in dsizes])
    a.set_xlabel("liczba filozofów n")
    a.grid(True, alpha=0.3)
ax[0].set_yscale("log")
ax[0].set_ylabel("czas do blokady [ms]")
ax[0].set_title("czas do blokady (tylko przebiegi z blokadą)", fontsize=10)
ax[1].set_ylabel("przebiegi z blokadą w ciągu 1 s [%]")
ax[1].set_title("odsetek przebiegów zakończonych blokadą", fontsize=10)
ax[1].set_ylim(0, 130)
ax[1].legend(fontsize=8, ncol=2, loc="upper center")
fig.tight_layout()
save(fig, "deadlock.png")

# two greedy philosophers (1 and 3): meals of every philosopher
starve = defaultdict(list)
with open(ROOT / "csv" / "starvation.csv") as f:
    for r in csv.DictReader(f):
        starve[r["impl"], int(r["philosopher"])].append((int(r["meals"]), float(r["max_wait_us"])))
fig, ax = plt.subplots(1, 2, figsize=(13, 4.2))
for j, (impl, label) in enumerate(IMPLS.items()):
    xs = np.arange(5) + (j - 1) * 0.27
    ax[0].bar(xs, [mean(m for m, _ in starve[impl, i]) for i in range(5)], width=0.26, color=STYLE[impl][1], label=label)
    ax[1].bar(xs, [max(w for _, w in starve[impl, i]) / 1e3 for i in range(5)], width=0.26, color=STYLE[impl][1], label=label)
for a in ax:
    a.set_xticks(range(5), [f"F{i}" + (" (żarłok)" if i in (1, 3) else "") for i in range(5)])
    a.grid(True, axis="y", alpha=0.3)
    a.legend(fontsize=8)
ax[0].set_ylabel("liczba posiłków w 3 s")
ax[0].set_title("posiłki (średnia z 3 przebiegów)", fontsize=10)
ax[1].set_ylabel("maks. czas oczekiwania [ms]")
ax[1].set_yscale("log")
ax[1].set_title("najdłuższe oczekiwanie na widelce", fontsize=10)
fig.tight_layout()
save(fig, "starvation.png")

# numbers for the report
print("\nn=5 / n=100 medians: throughput, mean wait us, max wait us, jain")
for s in SCENARIOS:
    for n in (5, 100):
        for impl in IMPLS:
            print(f"{s:5} n={n:<3} {impl:7}", *(f"{med(impl, s, n, c):12.1f}" for c in ("throughput", "mean_wait_us", "max_wait_us")),
                  f"{med(impl, s, n, 'jain'):.3f}")
print("\ndeadlock: scenario n deadlocked% median_ms median_meals")
for s in SCENARIOS:
    for n in dsizes:
        v = dead[s, n]
        ts = [t for d, t, _ in v if d]
        print(f"{s:5} n={n:<3} {100 * mean(d for d, _, _ in v):5.0f}%",
              f"{median(ts):9.2f}" if ts else "      -", median(m for _, _, m in v))
print("\nstarvation: impl meals per philosopher (mean), max wait ms")
for impl in IMPLS:
    print(impl, [round(mean(m for m, _ in starve[impl, i])) for i in range(5)],
          [round(max(w for _, w in starve[impl, i]) / 1e3, 1) for i in range(5)])
