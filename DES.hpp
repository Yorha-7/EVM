#include <iostream>
using namespace std;

namespace DES {
    string xor_round_key_data_right(string round_key, string data_right);
    string xor_right_data_left_data(string left_data, string right_data);
    string permuted_choice(string key);
    string key_left_circular_shift(string key, int times);
    string data_right_expansion(string data_right);
    string permutation_map(string data_right);
    string keyed_substitution(string data_right);
    string initial_permutation(string data);
    string inverse_initial_permutation(string data);
}
  