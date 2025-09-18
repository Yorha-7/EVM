#include"main.hpp"

int main(){
    string data = "abcdefgh";
    string key = "12345678";
    string decrypted_data;
    string encrypted_data;
    encrypted_data = encrypter::shift_encoding(data,key);
    cout << "Encrypted Data: " << encrypted_data << endl;
    encrypted_data = encrypter::initial_permutation(encrypted_data);
    cout << "Encrypted Data: " << encrypted_data << endl;
    encrypted_data = encrypter::permute_map1(encrypted_data);
    cout << "Encrypted Data: " << encrypted_data << endl;

    decrypted_data = decrypter::inverse_permute_map1(encrypted_data);
    cout << "Decrypted Data: " << decrypted_data << endl;
    decrypted_data = decrypter::inverse_initial_permutation(decrypted_data);
    cout << "Decrypted Data: " << decrypted_data << endl;
    decrypted_data = decrypter::shift_decoding(decrypted_data,key);
    cout << "Decrypted Data: " << decrypted_data << endl;
    return 0;
}