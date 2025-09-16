#include "DES.hpp"
#include <iostream>
using namespace std;
// 1,2,9,16
int main() {
    string key = "abcderty";
    string data = "abcdefgh";
    string round_key[16];
    string data_left = data.substr(0,4);
    string data_right = data.substr(4,4);
    string temp;
    int times = 2;
    // firts key processing //
    key = DES::permuted_choice(key);
    
    // // Round Key //
    string key_left = key.substr(0,4);
    string key_right = key.substr(4,4);
    for (int i = 0; i < 16; i++){
        if(i == 0 || i == 1 || i == 8 || i == 15)times = 1;
        else times = 2;
        key_left = DES::key_left_circular_shift(key_left,times);
        key_right = DES::key_left_circular_shift(key_right,times);

        round_key[i] = DES::permuted_choice(key_left + key_right);
        //cout << round_key[i] << " \n";

    }
    data = DES::initial_permutation(data);
    for(int j = 0; j<16; j++){
        cout << "Encryption Round " << j+1 << ": L=" << data_left << " R=" << data_right << endl;
        temp = data_right;
        data_right = DES::data_right_expansion(data_right);
        data_right = DES::xor_round_key_data_right(round_key[j],data_right);
        data_right = DES::keyed_substitution(data_right);
        data_right = DES::permutation_map(data_right);
        data_right = DES::xor_right_data_left_data(data_left, data_right);
        data_left = temp;
    }
    data = DES::inverse_initial_permutation(data_right+data_left);

    data = DES::initial_permutation(data);
    data_left = data.substr(0,4);
    data_right = data.substr(4,4);
    for(int j = 15; j>-1; j--){
        cout << "Decryption Round " << 16-j << ": L=" << data_left << " R=" << data_right << endl;
        temp = data_right;
        data_right = DES::data_right_expansion(data_right);
        data_right = DES::xor_round_key_data_right(round_key[j],data_right);
        data_right = DES::keyed_substitution(data_right);
        data_right = DES::permutation_map(data_right);
        data_right = DES::xor_right_data_left_data(data_left, data_right);
        data_left = temp;
    }
    cout << "Final Output: " << DES::inverse_initial_permutation(data_right+data_left) << endl;
}
