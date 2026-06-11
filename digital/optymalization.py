from collections import Counter

def analyze():
    nots = ["~D0", "~D0", "~D1", "~D0"]
    gates = [
        "D1~D0",
        "D2~D0",
        "D1D0",
        "D2~D1~D0",
        "D2D0",
        "D2D1"
    ]

    for s, c in Counter(nots).items():
        print(f"{s}: {c}")

    for g, c in Counter(gates).items():
        print(f"gate {g}: {c}")

if __name__ == "__main__":
    analyze()
