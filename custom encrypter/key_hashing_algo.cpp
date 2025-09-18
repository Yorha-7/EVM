#include <iostream>
using namespace std;


class codes {
    public:
    string master_key = "axYbjcd1";
    string baby_key   = "Babeigyl";

    string final_key;
    string data;
    string encoded_data;
    string decoded_data;
    uint8_t crc = 0;
    int data_indexes[100];   
    int count;              

    codes(string temp) {
        final_key = string(8, ' ');            
        data = temp;            
        CRC();
        encoded_data = string(data.length(), ' ');
        decoded_data = string(data.length(), ' ');
        for (int i = 0; i < 8; i++) {
            final_key[i] = (master_key[i] >= baby_key[i]) ? master_key[i] : baby_key[i];
        }
    }
    void change_data_size(){
        encoded_data = string(data.length(), ' ');
        decoded_data = string(data.length(), ' ');
    }
    void data_write(string temp){
        data = temp;
    }
    
    void bitlevel_mixing_encode(){
        int k = 0;
        for (int i = 0; i < data.length(); i++){
            if (k > 7) k = 0;
            encoded_data[i] = ((unsigned char)data[i] >> (final_key[k] % 8)) | ((unsigned char)data[i] << (8 - (final_key[k] % 8)));
        }
        cout<< "Encoding of bitlevel mixing: " << encoded_data << endl;
    }
    void bitlevel_mixing_decode(){
        int k = 0;
        for (int i = 0; i < data.length(); i++){
            if (k > 7) k = 0;
            decoded_data[i] = ((unsigned char)data[i] << (final_key[k] % 8)) | ((unsigned char)data[i] >> (8 - (final_key[k] % 8)));
        }
        cout<< "Decoding of bitlevel mixing: " << decoded_data << endl;
    }

    void xor_encoding(){
        count = data.length();
        int k = 0;
        for (int i = 0; i<count; i++){
            if(k > 7) k = 0;
            encoded_data[i] = (char)(data[i] ^ final_key[k]);
            k++;
        }
        cout << "XOR encoding: " << encoded_data << endl;
    }

    void xor_decoding(){
        count = data.length();
        int k = 0;
        for (int i = 0; i<count; i++){
            if(k > 7) k = 0;
            decoded_data[i] = (char)(data[i] ^ final_key[k]);
            k++;
        }
        cout << "XOR decoding: " << decoded_data << endl;
    }

    void shift_encoding() {
        count = data.length();
        for (int i = 0; i < 8; i++) {
            final_key[i] = (master_key[i] >= baby_key[i]) ? master_key[i] : baby_key[i];
        }

        int val[8];
        for (int i = 0; i < 8; i++) {
            val[i] = (int)final_key[i] % count;
        }

        int used[100];         
        for (int i = 0; i < count; i++) used[i] = 0;

        int k = 0;
        for (int i = 0; i < count; i++) {
            int idx;
            if (val[k] < count - i - 1) {
                idx = i + val[k];
            } else {
                idx = val[k] - (count - i - 1);
            }
            idx = (idx % count + count) % count;

            while (used[idx] == 1) {
                idx = (idx + 1) % count;
            }

            data_indexes[i] = idx;
            used[idx] = 1;

            k++;
            if (k >= 8) k = 0;
        }

        for (int i = 0; i < count ; i++){
            encoded_data[data_indexes[i]] = data[i];
        }

        cout << "Shift encoding: " << encoded_data << endl;
    }

    void shift_decoding() {
        count = data.length();
        for (int i = 0; i < count; i++) {
            decoded_data[i] = data[data_indexes[i]];
        }
        cout << "Shift decoding: " << decoded_data << endl;
    }
    
    void CRC(){
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
    }
    
    void Begin(){
        data = data + (char)crc;
    }
    
    void CRC_verifier(string final_data){
        crc = 0;
        string new_data = final_data;
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
        if (crc == 0){
            cout << "data is valid"<<endl;
        }
        else {
            cout << "data is changed!!!!"<<endl;
        }
    }
};