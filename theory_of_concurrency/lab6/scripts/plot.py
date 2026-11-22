"""Plots from csv/rw.csv and csv/list.csv written by Main, saved to plots/; prints the numbers used in the report."""
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
RW = {"sem": "semafory (pierwszeństwo czytelników)", "fair": "semafory + kołowrót", "cond": "zmienne warunkowe"}
LISTS = {"coarse": "jeden zamek", "fine": "blokowanie drobnoziarniste"}
STYLE = {"coarse": ("o", "tab:red"), "fine": ("s", "tab:blue")}

out = ROOT / "plots"
out.mkdir(exist_ok=True)
for stale in out.glob("*.png"):
    stale.unlink()


def save(fig, name):
    fig.savefig(out / name, dpi=130, bbox_inches="tight")
    plt.close(fig)
    print("saved", out / name)


rw = defaultdict(list)
with open(ROOT / "csv" / "rw.csv") as f:
    for r in csv.DictReader(f):
        rw[r["impl"], int(r["readers"]), int(r["writers"])].append(r)
readers = sorted({k[1] for k in rw})
writers = sorted({k[2] for k in rw})


def grid(impl, col):
    return np.array([[median(float(r[col]) for r in rw[impl, rd, wr]) for rd in readers] for wr in writers])


# 3D surfaces of the total time, shared z axis
times = {impl: grid(impl, "time_ms") for impl in RW}
zmax = max(g.max() for g in times.values())
X, Y = np.meshgrid(readers, writers)
fig = plt.figure(figsize=(17, 5.2))
for i, (impl, label) in enumerate(RW.items()):
    ax = fig.add_subplot(1, 3, i + 1, projection="3d")
    ax.plot_surface(X, Y, times[impl], cmap="viridis", vmin=0, vmax=zmax, edgecolor="k", linewidth=0.2)
    ax.set_zlim(0, zmax)
    ax.set_xlabel("liczba czytelników")
    ax.set_ylabel("liczba pisarzy")
    ax.set_zlabel("czas [ms]", labelpad=6)
    ax.set_title(label, fontsize=10)
    ax.view_init(elev=25, azim=-135)
fig.subplots_adjust(left=0.02, right=0.98, wspace=0.08)
save(fig, "rw_time.png")

# mean waiting time of writers and readers, heatmaps with a shared logarithmic scale
fig, ax = plt.subplots(2, 3, figsize=(17, 9.6), gridspec_kw={"hspace": 0.45})
for row, (col, who) in enumerate([("writer_wait_us", "pisarzy"), ("reader_wait_us", "czytelników")]):
    grids = {impl: grid(impl, col) / 1e3 for impl in RW}
    norm = LogNorm(max(min(g.min() for g in grids.values()), 1e-3), max(g.max() for g in grids.values()))
    for a, (impl, label) in zip(ax[row], RW.items()):
        im = a.imshow(grids[impl], origin="lower", cmap="magma", norm=norm, aspect="auto")
        a.set_xticks(range(len(readers)), readers)
        a.set_yticks(range(len(writers)), writers)
        a.set_xlabel("liczba czytelników")
        a.set_ylabel("liczba pisarzy")
        a.set_title(f"{label}\noczekiwanie {who}", fontsize=10)
    fig.colorbar(im, ax=ax[row], label="średni czas oczekiwania [ms]", shrink=0.9)
save(fig, "rw_wait.png")

# fine-grained vs one-lock list
lst = defaultdict(list)
with open(ROOT / "csv" / "list.csv") as f:
    for r in csv.DictReader(f):
        lst[r["impl"], int(r["cost_ns"]), int(r["threads"])].append(float(r["throughput"]))
costs = sorted({k[1] for k in lst})
threads = sorted({k[2] for k in lst})
thr = {k: median(v) for k, v in lst.items()}
fig, ax = plt.subplots(1, len(costs), figsize=(17, 4.2))
for a, c in zip(ax, costs):
    for impl, label in LISTS.items():
        marker, color = STYLE[impl]
        a.plot(threads, [thr[impl, c, t] for t in threads], marker=marker, ms=5, lw=1.0, color=color, label=label)
    a.set_xscale("log", base=2)
    a.set_xticks(threads, [str(t) for t in threads])
    a.minorticks_off()
    a.set_yscale("log")
    a.set_xlabel("liczba wątków")
    a.set_ylabel("operacje na sekundę")
    a.set_title(f"koszt operacji na elemencie: {c / 1000:g} µs", fontsize=10)
    a.grid(True, alpha=0.3)
handles, labels = ax[0].get_legend_handles_labels()
fig.legend(handles, labels, loc="lower center", ncol=2, fontsize=9, bbox_to_anchor=(0.5, -0.07))
fig.tight_layout()
save(fig, "list.png")

print("\nrw corners: impl R W time_ms reader_wait_ms writer_wait_ms writer_max_ms")
for impl in RW:
    for rd, wr in [(10, 1), (100, 1), (10, 10), (100, 10)]:
        v = rw[impl, rd, wr]
        print(f"{impl:5} R={rd:<3} W={wr:<2}", *(f"{median(float(r[c]) for r in v) / (1 if c == 'time_ms' else 1e3):9.2f}"
                                            for c in ("time_ms", "reader_wait_us", "writer_wait_us", "writer_max_wait_us")))
print("\nrw: time range per impl, max writer wait over grid [ms]")
for impl in RW:
    g = times[impl]
    print(impl, f"{g.min():.1f}-{g.max():.1f} ms", f"writer max wait {grid(impl, 'writer_max_wait_us').max() / 1e3:.1f} ms")
print("\nlist throughput: cost threads coarse fine speedup")
for c in costs:
    for t in threads:
        print(f"{c:6} T={t}", f"{thr['coarse', c, t]:12.0f} {thr['fine', c, t]:12.0f}", f"{thr['fine', c, t] / thr['coarse', c, t]:6.2f}")
