import subprocess 
import os
import time
import subprocess
import os
import time
from concurrent.futures import ProcessPoolExecutor
alphabet = [chr(i) for i in range(33, 126)] 
base = len(alphabet)
key = "!!!!!!!!"  
def run_code(key):
    compile_command = './run.sh'
    subprocess.run(compile_command, check=True)
    process = subprocess.Popen(
        ['./run'],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        encoding='utf-8',
        errors='replace',
        bufsize=1
    )
    process.stdin.write(key + "\n")
    process.stdin.flush()
    process.stdin.close()
    result = process.stdout.readline().rstrip()
    #print(result)
    #print(f"Execution Time: {end_time - start_time:.4f} seconds")
    process.stdin.close()
    ret = process.wait(timeout=30)
    return result
def increment_key():
    global key
    i = len(key) - 1
    while i >= 0:
        if ord(key[i]) < 126:
            key = key[:i] + chr(ord(key[i]) + 1) + key[i+1:]
            return True
        else:
            key = key[:i] + '!' + key[i+1:]
            i -= 1
    return False
def int_to_str(num, length):
    """Convert integer to string key of given length."""
    s = ""
    for _ in range(length):
        s = alphabet[num % base] + s
        num //= base
    return s

def str_to_int(s):
    """Convert string key to integer index."""
    num = 0
    for c in s:
        num = num * base + alphabet.index(c)
    return num
def execute_in_parallel(start,end):
    global key
    os.chdir("brute_force_v2")
    # for i in range(start,end):
    #     if not increment_key():
    #         break
    #     print(f"Trying key: '{key}'")
    #     output = run_code(key)
    #     if "Decrypted Data : @b(DE&gh" in output:
    #         print(f"Found the key: '{key}'")
    #         return [key]
    results = []
    for n in range(start, end):
        key = int_to_str(n, 8)  
        #print(f"Trying key: '{key}'")
        output = run_code(key)           
        if "Decrypted Data" in output:
            results.append(key)
    return results

if __name__ == "__main__":
    total_range = 93 ** 8 
    workers = os.cpu_count()
    chunck_size = total_range // workers
    
    with ProcessPoolExecutor(max_workers=workers) as executor:
        futures = []
        for w in range(workers):
            s = w * chunck_size
            e = (w + 1) * chunck_size if w != workers - 1 else total_range
            futures.append(executor.submit(execute_in_parallel,s,e)) 

            all_results = []
            for f in futures:
                all_results.extend(f.result())

        print(all_results)