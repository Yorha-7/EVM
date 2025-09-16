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

    string permutation_map(string data_right){
        string data_final;
        int map[32] = {16, 7, 20, 21, 29, 12, 28, 17,
                        1, 15, 23, 26, 5, 18, 31, 10,
                        2, 8, 24, 14, 32, 27, 3, 9,
                        19, 13, 30, 6, 22, 11, 4, 25
                    };
        int len = 32;
        for(int i = 0; i < len; i ++){
            data_final += data_right[map[i] - 1]; 
        }
        return data_final;
    }

    string xor_right_data_left_data(string left_data, string right_data){
        string final_data;
        int len = left_data.length();
        for(int i = 0; i < len; i++){
            final_data += static_cast<char>(right_data[i] ^ left_data[i]);
        }
        return final_data;
    }

    string xor_round_key_data_right(string round_key, string data_right){
        string final_data;
        int key_len = round_key.length();
        for (int i = 0; i < key_len; i++){
            final_data += static_cast<char>(round_key[i] ^ data_right[i]);
        }
        return final_data;
    }
    
    string keyed_substitution(string data_right){
        char constant = 0x5A; // You can choose any value (0x5A is just an example)
        string result;
        for (char c : data_right) {
            result += c ^ constant;
        }
        return result;
    }
    
    string permuted_choice(string key){
        int len = key.length();
        string final_key;
        string bit;
        string bit_string;
        for (int i = 0; i < len; i++){
            bit = bitset<8>(key[i]).to_string();
            bit.erase(7,1);
            bit_string += bit;            
        }
        len = bit_string.length();
        for(int i = 0; i < len ; i = i + 8){
            string byte = bit_string.substr(i,8);
            char c = static_cast<char>(bitset<8>(byte).to_ulong());
            final_key += c;
        }
        return final_key;        
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

    string data_right_expansion(string data_right){
        // DES-style reversible expansion: 32 bits to 48 bits
        int expansion_map[48] = {
            31, 0, 1, 2, 3, 4, 5, 4, 5, 6, 7, 8,
            9, 8, 9,10,11,12,13,12,13,14,15,16,
            17,16,17,18,19,20,21,20,21,22,23,24,
            25,24,25,26,27,28,29,28,29,30,31,0
        };
        string bit_string;
        for (char c : data_right)
            bit_string += bitset<8>(c).to_string(); // 32 bits

        string expanded_bits;
        for (int i = 0; i < 48; ++i)
            expanded_bits += bit_string[expansion_map[i]];

        string expanded;
        for (int i = 0; i < 48; i += 8)
            expanded += static_cast<char>(bitset<8>(expanded_bits.substr(i, 8)).to_ulong());

        return expanded;
    }

}
