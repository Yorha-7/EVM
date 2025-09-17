#include <iostream>
#include <cuda_runtime.h>

__device__ bool check_key(const char* candidate, const char* target, int length) {
    for (int i = 0; i < length; i++) {
        if (candidate[i] != target[i]) return false;
    }
    return true;
}

__global__ void brute_force(char* target, int length, bool* found, int* index) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // unique thread id

    // Each thread generates one candidate
    char candidate[5];  // 4 chars + null
    int base = 95;      // ASCII 32–126

    int n = id;
    for (int i = length - 1; i >= 0; i--) {
        candidate[i] = (char)(32 + (n % base));
        n /= base;
    }
    candidate[length] = '\0';

    if (check_key(candidate, target, length)) {
        *found = true;
        *index = id;
    }
}

int main() {
    const char* target = "abcd";
    int length = 4;

    // GPU memory
    char* d_target;
    bool* d_found;
    int* d_index;
    bool h_found = false;
    int h_index = -1;

    cudaMalloc(&d_target, length);
    cudaMalloc(&d_found, sizeof(bool));
    cudaMalloc(&d_index, sizeof(int));

    cudaMemcpy(d_target, target, length, cudaMemcpyHostToDevice);
    cudaMemcpy(d_found, &h_found, sizeof(bool), cudaMemcpyHostToDevice);

    int threads = 256;
    int blocks = (95*95*95*95 + threads - 1) / threads; // enough threads

    brute_force<<<blocks, threads>>>(d_target, length, d_found, d_index);

    cudaMemcpy(&h_found, d_found, sizeof(bool), cudaMemcpyDeviceToHost);
    cudaMemcpy(&h_index, d_index, sizeof(int), cudaMemcpyDeviceToHost);

    if (h_found) {
        std::cout << "Key found at index: " << h_index << std::endl;
    }

    cudaFree(d_target);
    cudaFree(d_found);
    cudaFree(d_index);
    return 0;
}
