#!/bin/usr/dev python

side_length, max_length, mapper, coastline, plots = 0, 0, [], [], []# Create lists for map, coastline, and sets

with open('sample.txt') as f:
    side_length = int(f.readline())# side_length is the first value in text file
    mapper = f.read().splitlines()# read rest of text file to the mapper

for y in mapper:
    if len(y) > max_length:
        max_length = len(y)# Value to be used later in creating sets
    for x in y:
        if x == "*":
            coastline.append((index[y], index[x]))# Co-ords are (row, column) top down, left right.

for y in mapper:
    for x in range(max_length - side_length):
        subset = []
        for yy in range(side_length):
            for xx in range(side_length):
                subset.append((index(y) + yy, x + xx))
        plots.append(subset)
