"""Plots from csv/times.csv written by Main, saved to plots/; prints the numbers used in the report."""
import csv
from collections import defaultdict
from pathlib import Path
from statistics import median

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parent.parent
IMPLS = {"ao": ("Active Object", "-"), "monitor": ("monitor", "--")}
CAP_COLOR = {1: "tab:red", 10: "tab:blue", 100: "tab:green"}

out = ROOT / "plots"
out.mkdir(exist_ok=True)
for stale in out.glob("*.png"):
    stale.unlink()

runs = defaultdict(list)
with open(ROOT / "csv" / "times.csv") as f:
    for r in csv.DictReader(f):
        runs[r["impl"], int(r["servant_us"]), int(r["threads"]), int(r["capacity"]), int(r["work_us"])].append(float(r["time_ms"]))
t = {k: median(v) for k, v in runs.items()}
servants = sorted({k[1] for k in t})
threads = sorted({k[2] for k in t})
caps = sorted({k[3] for k in t})
works = sorted({k[4] for k in t})

for s in servants:
    fig, ax = plt.subplots(1, len(works), figsize=(16, 4.3))
    for a, w in zip(ax, works):
        for impl, (label, ls) in IMPLS.items():
            for c in caps:
                a.plot(threads, [t[impl, s, p, c, w] for p in threads], ls, marker="o" if impl == "ao" else "s", ms=4,
                       lw=1.1, color=CAP_COLOR[c], label=f"{label}, bufor {c}")
        a.set_xscale("log", base=2)
        a.set_xticks(threads, [str(p) for p in threads])
        a.minorticks_off()
        a.set_yscale("log")
        a.set_xlabel("liczba producentów = liczba konsumentów")
        a.set_ylabel("czas przekazania 20 000 elementów [ms]")
        a.set_title(f"praca klienta {w} µs, koszt operacji bufora {s} µs", fontsize=10)
        a.grid(True, alpha=0.3)
    handles, labels = ax[0].get_legend_handles_labels()
    fig.legend(handles, labels, loc="lower center", ncol=6, fontsize=8.5, bbox_to_anchor=(0.5, -0.08))
    fig.tight_layout()
    fig.savefig(out / f"times_s{s}.png", dpi=130, bbox_inches="tight")
    plt.close(fig)
    print("saved", out / f"times_s{s}.png")

print("\nmedians [ms]: servant work cap | p=1..8 ao / monitor | ratio ao/monitor")
for s in servants:
    for w in works:
        for c in caps:
            ao = [t["ao", s, p, c, w] for p in threads]
            mo = [t["monitor", s, p, c, w] for p in threads]
            print(f"s={s:<2} w={w:<3} cap={c:<3}", " ".join(f"{x:8.1f}" for x in ao), "|",
                  " ".join(f"{x:8.1f}" for x in mo), "|", " ".join(f"{a / m:5.2f}" for a, m in zip(ao, mo)))
