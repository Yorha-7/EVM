#! /bin/bash

g++ Diffi-Hellman.cpp key_exchange_algo_test.cpp -l profiler -o diff_test
./diff_test
