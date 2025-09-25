#include"../include/main.hpp"
#include<profiler.hpp>
string Encryption(string data, string key){
    string round_key[256];
    string cipher = data;

    for (int i = 0; i < 256 ; i++){
        //live key generation //
        round_key[i] = encrypter::key_left_circular_shift(key,2);
        round_key[i] = encrypter::permute_map1(round_key[i]);
        round_key[i] = encrypter::initial_permutation(round_key[i]);
        key = round_key[i];
        // live key usage //
        cipher = encrypter::shift_encoding(cipher,round_key[i]);
        cipher = encrypter::initial_permutation(cipher);
        cipher = encrypter::xor_key_data(cipher,round_key[i]);
        cipher = encrypter::noise(cipher);
        cipher = encrypter::permute_map1(cipher);
    }
    return cipher;
}

string Decryption(string data, string key){
    string round_key[256];
    string decipher = data;
    for (int i = 0; i < 256 ; i++){
        //live key generation //
        round_key[i] = encrypter::key_left_circular_shift(key,2);
        round_key[i] = encrypter::permute_map1(round_key[i]);
        round_key[i] = encrypter::initial_permutation(round_key[i]);
        key = round_key[i];
    }
    for (int i = 255; i >= 0 ; i--){
        // live key usage //
        decipher = decrypter::inverse_permute_map1(decipher);
        decipher = decrypter::noise(decipher);
        decipher = decrypter::xor_key_data(decipher,round_key[i]);
        decipher = decrypter::inverse_initial_permutation(decipher);
        decipher = decrypter::shift_decoding(decipher,round_key[i]);
    }
    return decipher;
}

int main(){
    Profiler p;
    string data = "@b(DE&gh";
    string key ;
    string decrypted_data;
    string encrypted_data;
    cout << "Enter The Key (8 characters) : ";
    cin >> key;
    if(key.length() != 8){
        cout << "Key must be of 8 characters" << endl;
        return 0;
    }
    cout << "Original Data : " << data << endl;
    encrypted_data = Encryption(data,key);
    cout << "Encrypted Data : " << encrypted_data << endl;
    // Encryption of some data on fixed key //
    decrypted_data = Decryption(encrypted_data,key);
    cout << "Decrypted Data : " << decrypted_data << endl;
    return 0;
}

