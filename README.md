# Electronic Voting Machine
 this project is a refrence from a professor from a NIT in india. though voting machine on fpga is not a big deal though i was curious about one thing that was in his paper.
 making a secured voting machine. So I thought, lets make one. umm not the voting machine, The security algorithm, this repo is like a tour to world of encryption and security.
 i will achive two basic thigs in this, first i will explore a domain i was unawre of, that is the security and {might} i will make myself my own algoritmh of encryption, though it sound so stupid.
 i am really hoping to get to a summer interns by the end of the year. hope my work is enough!

## Brute Force (cpp code)
about this code, its a very basic brute force code trying to guess the final_key, just a demonstration how the length of key affects on cpu to find the key

## Cude_boosted (Cuda)
this one is the same thing as the Brute Force code, but uses GPU to crack the code, its pretty fast, to us ethis you nedd to build the .cu with cuda build.
then us the excutable in terminal to make it run, its quite simple when you use vscode, btw it duh needs some installation and only works for the nvidia gpus,
iam not botherd adding the installtion process, figure out yourself.

## Key hashing algo (cpp)
now this is something i should be talking about. 
 this badass code is a library with class codes, that have basic functionality for encrypting in three diffrent methods also decrypting too, and a briliant CRC algorthm, 
which i belieive it follows x^8 + x^6 + x^4 + x^2 + 1 as algo for the xoring, and also the crc verifier in which you need to send what data you got.
this i swhere i will add more functinalty to make key dynamic or i say highly complicated. again its future plans, no promises.

## import testing
this is the code where all magic happens. you are free to use it to test the hashing algorithms, its a playgound, to make this playground more like a gym than playground, i let all the variables accessible
or i say i set them free. this way coder will have full down level tweaking of what kind of input should go to the algos, this way higher level of encryption can be achived by just from simple algos.
```
 This Code is Coded by Yorha-7 �
Shift encoding: C eahY7-idCe  s�id o dsr Tooyhb
Encoding of bitlevel mixing: ���4����2����2�2�9*���41
XOR encoding: �h��^����J��zw���Jr�zU�UqR���SH
XOR decoding: ���4����2����2�2�9*���41
Decoding of bitlevel mixing: C eahY7-idCe  s�id o dsr Tooyhb
Shift decoding:  This Code is Coded by Yorha-7
data is changed!!!!
[1] + Done 
```
## Encrypter Simulation Result.
<img width="1290" height="1058" alt="Screenshot 2025-09-13 160746" src="https://github.com/user-attachments/assets/40cec56a-6344-41c0-b8ca-0cc794e68cf0" />

## Encrypter Block Diagram.
<img width="1508" height="318" alt="Screenshot 2025-09-13 160841" src="https://github.com/user-attachments/assets/f0fb2b7f-cc56-4935-b687-144619e626b6" />

## Something about: DES brute force cracker

i know its lame to evene trying to crack it by brute forcing, but some guy in 70's did it within 3 hours of that 64 bit key, man with the best computer (rpi 3B+) i did cracked the 32 bit key by brute force, i know no surprise but while
doing that i made a cmake package taht is universal lib in your system that is ready to be imported in your cpp codes that will give ... ummmh i have special repo on that, no need to type in here.
so check this results out, BTW my rpi was heating as hell , they are right when they say get yourself a heat sink, though rpi have inbuilt temperature regulaton so it will slow the perormance but it still works.

```
Take 1:
Encrypted Data: ����od��
Decrypted Data: abcdefgh
Key used for decryption:        A
Time taken to find key: 0.014647 seconds

[Profiler] Execution Time: 15 ms
[Profiler] Memory Usage: 0 KB
                                  
Take 2:
Encrypted Data: ����Gl��
Decrypted Data: abcdefgh
Key used for decryption:       AA
Time taken to find key: 0.722212 seconds

[Profiler] Execution Time: 726 ms
[Profiler] Memory Usage: 0 KB

Take 3:
Encrypted Data: �����L��
Decrypted Data: abcdefgh
Key used for decryption:      AAA
Time taken to find key: 73.1843 seconds

[Profiler] Execution Time: 73216 ms
[Profiler] Memory Usage: 0 KB

Take 4:
Encrypted Data: �761e̘�
Decrypted Data: abcdefgh
Key used for decryption:     AAAA
Time taken to find key: 6860.5 seconds

[Profiler] Execution Time: 6863508 ms
[Profiler] Memory Usage: 0 KB
                 
Take 5:
to be calculated (waste of time)
```
