#include"Diffi-Hellman.cpp"
#include"profiler.hpp"
int main(){
    Profiler p;
    Diffi_Hellman A(95,555057007,23);
    Diffi_Hellman B(101,555057007,23);
    u_int64_t A_value = A.get_value();
    u_int64_t B_value = B.get_value();
    std::cout << "A Value: " << A_value << std::endl;
    std::cout << "B Value: " << B_value << std::endl;
    u_int64_t A_key = A.generate_key(B_value);
    u_int64_t B_key = B.generate_key(A_value);
    std::cout << "A Key: " << A_key << std::endl;
    std::cout << "B Key: " << B_key << std::endl;
    if (A_key == B_key){
        std::cout << "Keys Match!" << std::endl;
    } else {
        std::cout << "Keys Do Not Match!" << std::endl;
    }
    return 0;
}
