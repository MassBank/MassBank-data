#!/usr/bin/python3
import sys
if len(sys.argv) < 2:
    print("Usage: python fix.py <filename>")
    sys.exit(1)
filename = sys.argv[1]
try:
    with open(filename, "r") as file:
        lines = file.readlines()
    peaklist = []
    found_pkpeak = False
    for line in lines:
        if not found_pkpeak:
            if line.startswith("PK$PEAK"):
                found_pkpeak = True
        else:
            if not line.startswith("//"):
                values = line.split()
                if len(values) != 3:
                    raise ValueError(f"Line in peaklist does not have exactly 3 fields: {line.strip()}")
                peaklist.append(values)
    print("Peaklist:", peaklist)
    max_intensity = float('-inf')
    for values in peaklist:
        if len(values) >= 2:
            value = float(values[1])
            if value > max_intensity:
                max_intensity = value
    print(f"Maximum intensity is: {max_intensity}")
    for values in peaklist:
        values[2] = str(round(float(values[1]) * 999 / max_intensity))
    found_pkpeak = False
    with open(filename, "w") as file:
        for line in lines:
            if not found_pkpeak:
                file.write(line)
                if line.startswith("PK$PEAK"):
                    found_pkpeak = True
        for values in peaklist:
            file.write("  " + " ".join(values) + "\n")
        file.write("//\n")
except FileNotFoundError:
    print(f"File {filename} not found.")
    sys.exit(1)
except ValueError as e:
    print(f"Error in file {filename}.")
    print(e)
    sys.exit(1)
