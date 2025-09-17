#include "DES.hpp"
#include <bitset>

namespace DES {
    
    string initial_permutation(string data){
        int map[8]={58,60,62,64,57,59,61,63};
        string data_bit;
        string final_data_bit;
        string final_data;
        int len = data.length();
        for(int i = 0; i < len ; i++){
            data_bit += bitset<8>(data[i]).to_string();
        }
        for (int i = 0; i < 8; i++){
            for(int k = 0; k < 57; k = k + 8){
                //cout << map[i] - k - 1 << " ";
                final_data_bit += data_bit[map[i] - k - 1];
            }
            //cout << "\n";
            final_data += static_cast<char>(bitset<8>(final_data_bit.substr(8*i,8)).to_ulong());
        }
        
        return final_data;
    }

    string inverse_initial_permutation(string data){
        int map[8] = {40,8,48,16,56,24,64,32};
        int len = data.length();
        string data_bit;
        string final_data_bit;
        string final_data;
        for(int i = 0; i<len; i++){
            data_bit += bitset<8>(data[i]).to_string();
        }
        for (int k = 0; k < 8; k++){
            for(int i = 0; i < 8 ; i++){
                //cout << map[i] - k - 1 << " ";
                final_data_bit += data_bit[map[i] - k - 1];
            }
            final_data += static_cast<char>(bitset<8>(final_data_bit.substr(8*k,8)).to_ulong());
            //cout << "\n";
        }

            
        return final_data;
    }
        string key_left_circular_shift(string key, int times) {
        string bit_string;
        string final_key;
        int len = key.length();
        for (int i = 0; i < len; i++){
            bit_string += bitset<8>(key[i]).to_string();
        }
        len = bit_string.length();
        bit_string = bit_string.substr(times) + bit_string.substr(0,times);
        for(int i = 0; i < len; i = i + 8){
            string byte = bit_string.substr(i,8);
            char c = static_cast<char>(bitset<8>(byte).to_ulong());
            final_key += c;
        }
        return final_key;
    }
    string xor_key_data(string data, string key){
        string final_data;
        int key_len = key.length();
        for (int i = 0; i < key_len; i++){
            final_data += static_cast<char>(key[i] ^ data[i]);
        }
        return final_data;
    }

}
