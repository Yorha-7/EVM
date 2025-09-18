#include<iostream>
using namespace std;
namespace encrypter {
    string shift_encoding(string data, string key);
    string CRC(string data);
    string initial_permutation(string data);
    string permute_map1(string data);
    string inverse_permute_map1(string data);
}

namespace decrypter {
    string shift_decoding(string data, string key);
    string inverse_initial_permutation(string data);
    string inverse_permute_map1(string data);
}