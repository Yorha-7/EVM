#include<iostream>

class Diffi_Hellman {
    private:
    u_int64_t initial_guess;
    u_int64_t modular;
    u_int64_t base;

    public:
    Diffi_Hellman(u_int64_t ig, u_int64_t m, u_int64_t b) {
        initial_guess = ig;
        modular = m;
        base = b;
    }
    u_int64_t get_value(){
        return (base ^ initial_guess) % modular;
    }
    
    u_int64_t generate_key(u_int64_t other_value){
        return (other_value ^ initial_guess) % modular;
    }

};

class Diffi_Hellman_v2 {
    private:
    u_int64_t initial_guess;
    u_int64_t modular;
    u_int64_t base;

    public:
    Diffi_Hellman_v2(u_int64_t ig, u_int64_t m, u_int64_t b) {
        initial_guess = ig;
        modular = m;
        base = b;
    }

    u_int64_t get_value(){
        u_int64_t value = 1;
        for(u_int64_t i = 0; i < initial_guess; i++){
            value = (value * base) % modular;
        };
        return value;
    }

    u_int64_t generate_key(u_int64_t other_value){
        u_int64_t value = 1;
        for(u_int64_t i = 0; i<initial_guess; i++){
            value = (value * other_value) % modular;
        }
        return value;
    }
};