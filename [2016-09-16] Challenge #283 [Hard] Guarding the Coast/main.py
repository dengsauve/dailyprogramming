#!/bin/usr/dev python

mapper = []

with open('sample.txt') as f:
    mapper = f.read().splitlines()

for i in mapper:
    print(i)

input("hi")
