#! /bin/bash

g++ src/test.cpp include/main.hpp src/main.cpp -l profiler -o run
./run
