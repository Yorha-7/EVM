#include"../include/main.hpp"
string Encryption(string data){
    string round_key[16];
    string key = "12345678";
    string cipher = data;

    for (int i = 0; i < 16 ; i++){
        //live key generation //
        round_key[i] = encrypter::key_left_circular_shift(key,2);
        round_key[i] = encrypter::permute_map1(round_key[i]);
        round_key[i] = encrypter::initial_permutation(round_key[i]);
        key = round_key[i];
        // live key usage //
        cipher = encrypter::shift_encoding(cipher,round_key[i]);
        cipher = encrypter::initial_permutation(cipher);
        cipher = encrypter::xor_key_data(cipher,round_key[i]);
        cipher = encrypter::permute_map1(cipher);
    }
    return cipher;
}

string Decryption(string data, string key){
    string round_key[16];
    string decipher = data;
    for (int i = 0; i < 16 ; i++){
        //live key generation //
        round_key[i] = encrypter::key_left_circular_shift(key,2);
        round_key[i] = encrypter::permute_map1(round_key[i]);
        round_key[i] = encrypter::initial_permutation(round_key[i]);
        key = round_key[i];
    }
    for (int i = 15; i >= 0 ; i--){
        // live key usage //
        decipher = decrypter::inverse_permute_map1(decipher);
        decipher = decrypter::xor_key_data(decipher,round_key[i]);
        decipher = decrypter::inverse_initial_permutation(decipher);
        decipher = decrypter::shift_decoding(decipher,round_key[i]);
    }
    return decipher;
}

int main(){
    string data = "@b(DE&gh";
    string key ;
    string decrypted_data;
    string encrypted_data;
    cin >> key;
    if(key.length() != 8){
        cout << "Key must be of 8 characters" << flush;
        return 0;
    }
    encrypted_data = Encryption(data);
    decrypted_data = Decryption(encrypted_data,key);
    cout << decrypted_data << flush;
    return 0;
}

