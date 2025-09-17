#! /bin/bash

g++ DES.cpp DES_bruteforce.cpp test.cpp -l profiler -o des_test
echo  "Wait for 7 Second approximately"
./des_test
