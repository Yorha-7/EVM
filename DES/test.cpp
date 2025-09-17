#include "DES.hpp"
#include <iostream>
using namespace std;
// 1,2,9,16
class des {
    public:
    string round_key[6];
    string get_key(int item) {
        return round_key[item];
    }
    
    string key = string(8, ' ');
    string key_left = key.substr(0,4);
    string key_right = key.substr(4,4);
    string data;
    int times = 1;
    // firts key processing //
    //key = DES::permuted_choice(key);
    // // Round Key //
    des(){
        key_generator();
    }
    void key_generator(){
        key_left = key.substr(0,4);
        key_right = key.substr(4,4);
        for (int i = 0; i<6;i++){
            key_left = DES::key_left_circular_shift(key_left, times);
            key_right = DES::key_left_circular_shift(key_right, times);
            round_key[i] = key_left + key_right;
        }
    }

    void key_write(string data_input){
        key = data_input;
    }

    string encrypter(string cipher,string key="     AwA"){
        key_write(key);
        key_generator();
        for(int i = 0;i<6; i++){
            cipher = DES::initial_permutation(cipher);
            cipher = DES::xor_key_data(cipher,round_key[i]);
            cipher = DES::inverse_initial_permutation(cipher);
            //cout <<"Encrypt: "<<i + 1<< "Cipher: " << cipher << endl;
        }
        return cipher;
    }
    
    string decrypter(string cipher,string key_t){
        key_write(key_t);
        key_generator();
        for(int i = 5; i>-1; i--){
            cipher = DES::initial_permutation(cipher);
            cipher = DES::xor_key_data(cipher,round_key[i]);
            cipher = DES::inverse_initial_permutation(cipher);
            //cout <<"Decrypt: "<< 6 - i<< " Cipher: " << cipher << endl;
        }
    return cipher;
    }
    



};
