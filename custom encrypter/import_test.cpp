#include "key_hashing_algo.cpp"

// class Begin {
//     public:
//     Begin() {
//     codes temp("this code is coded by Yorha");
//     temp.CRC();
//     temp.bitlevel_mixing_encode();
//     temp.data_write(temp.encoded_data);
//     temp.shift_encoding();

//     temp.shift_decoding();
//     temp.data_write(temp.decoded_data);
//     temp.bitlevel_mixing_decode();
//     cout << temp.decoded_data << endl;
//     }
// };
// This Code contains verificatuion, of shift, xor, binary shift, and crc verfication
int main(){
    codes temp("This Code is Coded by Yorha-7");
    temp.Begin();
    temp.change_data_size();
    temp.data = " This Code is Coded by Yorha-7 ";           // Simply comment this out to send verified data only
    temp.change_data_size();
    temp.Begin();
    cout << temp.data << endl;
    temp.shift_encoding();
    temp.data_write(temp.encoded_data);
    temp.bitlevel_mixing_encode();
    temp.data_write(temp.encoded_data);
    temp.xor_encoding();
    temp.data_write(temp.encoded_data);
    temp.xor_decoding();
    temp.data_write(temp.decoded_data);
    temp.bitlevel_mixing_decode();
    temp.data_write(temp.decoded_data);
    temp.shift_decoding();
    temp.data_write(temp.decoded_data);
    temp.CRC_verifier(temp.data);
}