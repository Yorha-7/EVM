#include<iostream>
#include "key_hashing_algo.cpp"

int main(){
    codes temp("this code is coded by Yorha");
    temp.bitlevel_mixing_encode();
    temp.data_write(temp.encoded_data);
    temp.shift_encoding();

    temp.shift_decoding();
    temp.data_write(temp.decoded_data);
    temp.bitlevel_mixing_decode();
    cout << temp.decoded_data << endl;
}