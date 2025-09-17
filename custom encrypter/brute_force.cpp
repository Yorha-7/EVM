#include <iostream>
#include <string>
using namespace std;

string key_final = "AAYo";
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

int main() {
    string key(4, 32);

    do {
        if (key == key_final) {
            cout << "Key found: " << key << endl;
            break;
        }
    } while (increment_key(key));

    return 0;
}
