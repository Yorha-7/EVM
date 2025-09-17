#include<iostream>
#include"test.cpp"
#include<ctime>
#include<profiler.hpp>

bool increment_key(string &key) {
    int i = key.size() - 1;
    while (i >= 0) {
        if (key[i] < 126) {      
            key[i]++;
            return true;
        } else {
            key[i] = 32;          
            i--;
        }
    }
    return false; 
}
int main(){
    Profiler p;
    clock_t start,end;
    start = clock();
    des d;
    string data = "abcdefgh";
    string key = string(8, ' ');
    string cipher = d.encrypter(data);
    cout << "Encrypted Data: " << cipher << endl;
    

    
    do {
        string decrypted_data = d.decrypter(cipher,key);
        //cout << decrypted_data << " : " << key << endl ;
        //cout << "Trying Key: " << key << endl;
        //cout<<"Working ... key"<< key << endl;
        if(decrypted_data == data){
            cout << "Decrypted Data: " << decrypted_data << endl;
            cout << "Key used for decryption: " << key << endl;
            end = clock();
            double time_taken = double(end - start) / CLOCKS_PER_SEC;
            cout << "Time taken to find key: " << time_taken << " seconds" << endl;
            break;
        }
    }while(increment_key(key));
}
