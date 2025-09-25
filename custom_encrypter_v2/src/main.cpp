#include"../include/main.hpp"
#include<bitset>
// this part of code library will contain some mixed algorithms and improvements based on the 
// previous version of custom encrypter by adding more elemnts for confusion and diffusion
// and also generating concept of round key from DES.
using namespace std;
namespace encrypter {

    ///            Data Operation             ///////

    string shift_encoding(string data, string key){
        int start = 0; for(int i = 0; i < key.length(); i++) start+= (int)key[i];
        start = start % data.length();
        string encoded_data = string(data.length(), ' ');
        int prime = 7; 
        for (int i = 0; i < data.length(); i++){
            int idx = start + i * prime;
            idx = idx % data.length();
            encoded_data[idx] = data[i];
        }
        return encoded_data;
    }
    
    string CRC(string data){
        uint8_t crc = 0;
        string new_data = data + string(1,'\0');
        for (int i = 0; i < new_data.length(); i++){
            for(int k = 7; k>=0; k--){
                int incoming_bit = (new_data[i]>>k & 1);
                int outgoing_bit = ((crc >> 7) & 1);
                crc = crc << 1;
                crc = crc | incoming_bit;
                if (outgoing_bit == 1){
                    crc = crc ^ 85;
                    }
                }
            }
        return to_string(crc);
    }

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
                //cout << temp_map[i] - k - 1 << " " << endl;
                final_data_bit += data_bit[map[i] - k - 1];
            }
            //cout << "\n";
            final_data += static_cast<char>(bitset<8>(final_data_bit.substr(8*i,8)).to_ulong());
        }              
        
        return final_data;
    }

    string permute_map1(string data){
        int map[8][8] = {
                         {43,25,19,29,53,36,58,51},
                         {41,34,60,3,6,32,57,61},
                         {48,52,18,38,45,14,31,55},
                         {16,9,0,44,49,42,54,30},
                         {23,20,4,12,21,37,59,40},
                         {35,2,27,17,11,50,62,56},
                         {47,13,7,1,22,26,33,10},
                         {5,28,15,46,63,8,39,24}
                        };
        string data_bit;
        string final_data_bit;
        string final_data;
        int len = data.length();
        for(int i = 0; i < len ; i++){
            data_bit += bitset<8>(data[i]).to_string();
        }
        for (int i = 0; i < 8; i++){
            for(int k = 0; k < 8; k++){
                final_data_bit += data_bit[map[i][k]];
            }
            final_data += static_cast<char>(bitset<8>(final_data_bit.substr(8*i,8)).to_ulong());
        }
        return final_data;
    }
                 /// Key Operation      //////
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
    
    string noise(string data){
        string final_data;
        int map[data.length()] = {56,23,01,45,67,89,12,89};
        for (int i = 0; i < data.length(); i++){
            final_data += static_cast<char>(data[i] ^ map[i]);
        }
        return final_data;
    }
}

namespace decrypter {

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
    
    string inverse_permute_map1(string data){
        int map[8][8] = {
                         {26,51,41,11,34,56,12,50},
                         {61,25,55,44,35,49,21,58},
                         {24,43,18,2,33,36,52,32},
                         {63,1,53,42,57,3,31,22},
                         {13,54,9,40,5,37,19,62},
                         {39,8,29,0,27,20,59,48},
                         {16,28,45,7,17,4,30,23},
                         {47,14,6,38,10,15,46,60}
                        };
            string data_bit;
            string final_data_bit;
            string final_data;
            int len = data.length();
            for(int i = 0; i < len ; i++){
                data_bit += bitset<8>(data[i]).to_string();
            }
            for (int i = 0; i < 8; i++){
                for(int k = 0; k < 8; k++){
                    final_data_bit += data_bit[map[i][k]];
                }
                final_data += static_cast<char>(bitset<8>(final_data_bit.substr(8*i,8)).to_ulong());
            }
            return final_data;
               
            }
            
    string shift_decoding(string data, string key){
        int start = 0; for(int i = 0; i < key.length(); i++) start+= (int)key[i];
        start = start % data.length();
        string decoded_data = string(data.length(), ' ');
        int prime = 7; 
        for (int i = 0; i < data.length(); i++){
            int idx = start + i * prime;
            idx = idx % data.length();
            decoded_data[i] = data[idx];
        }
        return decoded_data;
    }
    
    string xor_key_data(string data, string key){
        string final_data;
        int key_len = key.length();
        for (int i = 0; i < key_len; i++){
            final_data += static_cast<char>(key[i] ^ data[i]);
        }
        return final_data;
    }

    string noise(string data){
        string final_data;
        int map[data.length()] = {56,23,01,45,67,89,12,89};
        for (int i = 0; i < data.length(); i++){
            final_data += static_cast<char>(data[i] ^ map[i]);
        }
        return final_data;
    }
}