#include <iostream>
using namespace std;

string master_key = "axYbjcd1";
string baby_key   = "Babeigyl";

class codes {
    public:
    string final_key;
    string data;
    string encoded_data;
    string decoded_data;
    int data_indexes[100];   // <-- store mapping here
    int count;               // length of data

    codes() {
        final_key = string(8, ' ');            
        data = "This code is Coded by Yorha";             
        encoded_data = string(data.length(), ' ');
        decoded_data = string(data.length(), ' ');
        for (int i = 0; i < 8; i++) {
            final_key[i] = (master_key[i] >= baby_key[i]) ? master_key[i] : baby_key[i];
        }
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
            decoded_data[i] = (char)(encoded_data[i] ^ final_key[k]);
            k++;
        }
        cout << "XOR decoding: " << decoded_data << endl;
    }

    void shift_encoding() {
        
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
        for (int i = 0; i < count; i++) {
            decoded_data[i] = encoded_data[data_indexes[i]];
        }
        cout << "Shift decoding: " << decoded_data << endl;
    }
};

int main(){
    codes code;
    code.xor_encoding();
    code.xor_decoding();
    code.shift_encoding();
    code.shift_decoding();
}
