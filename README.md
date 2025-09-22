# Electronic Voting Machine
 this project is a refrence from a professor from a NIT in india. though voting machine on fpga is not a big deal though i was curious about one thing that was in his paper.
 making a secured voting machine. So I thought, lets make one. umm not the voting machine, The security algorithm, this repo is like a tour to world of encryption and security.
 i will achive two basic thigs in this, first i will explore a domain i was unawre of, that is the security and {might} i will make myself my own algoritmh of encryption, though it sound so stupid. hope my work is enough!

## Something about: custom_encrypter_v2
this packages consist of the source code for simulating the nature of 16 layer encryption algorithm which contains 3 major concept and methods from 3 diffrent algos. Mostly it is DES but to increase the 
Diffussion i added more of the map scrambling after xoring with key and to generate a non repetative key i used the key mapping to generate confusion.
no need to test for avalanche case cuz it already follow major principals, so it should work.

also i ahve one more version of this brute force testing as brute_force_v2 file, the python script is a modiication from before which supports parrallel tasking on cpu and begineer friendly code to crack key using paralle computation.
one more thing the pkg custom_encrypter_v2 is a cmake package ready to be installed as .deb to run it on linux uder apt package manager.
and brute_force is just brute_force.

## Something about: Brute Force (cpp code)
about this code, its a very basic brute force code trying to guess the final_key, just a demonstration how the length of key affects on cpu to find the key

## Something about: Cude_boosted (Cuda)
this one is the same thing as the Brute Force code, but uses GPU to crack the code, its pretty fast, to us ethis you nedd to build the .cu with cuda build.
then us the excutable in terminal to make it run, its quite simple when you use vscode, btw it duh needs some installation and only works for the nvidia gpus,
iam not botherd adding the installtion process, figure out yourself.

## Something about: Key hashing algo (cpp)
now this is something i should be talking about. 
 this badass code is a library with class codes, that have basic functionality for encrypting in three diffrent methods also decrypting too, and a briliant CRC algorthm, 
which i belieive it follows x^8 + x^6 + x^4 + x^2 + 1 as algo for the xoring, and also the crc verifier in which you need to send what data you got.
this i swhere i will add more functinalty to make key dynamic or i say highly complicated. again its future plans, no promises.

## Something about: import testing
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
## Something about: Encrypter Simulation Result (Combinotorial).
<img width="1290" height="1058" alt="Screenshot 2025-09-13 160746" src="https://github.com/user-attachments/assets/40cec56a-6344-41c0-b8ca-0cc794e68cf0" />

## Something about: Encrypter Block Diagram (Combinotorial).
<img width="1508" height="318" alt="Screenshot 2025-09-13 160841" src="https://github.com/user-attachments/assets/f0fb2b7f-cc56-4935-b687-144619e626b6" />

## Something about: DES brute force cracker

i know its lame to evene trying to crack it by brute forcing, but some guy in 70's did it within 3 hours of that 64 bit key, man with the best computer (rpi 3B+) i did cracked the 32 bit key by brute force plus my DES is not even in its original standard, yhea but i did try to add elements of confusion and diffussion. i know no surprise but while doing that i made a cmake package taht is universal lib in your system that is ready to be imported in your cpp codes that will give ... ummmh i have special repo on that, no need to type in here. so check this results out, BTW my rpi was heating as hell , they are right when they say get yourself a heat sink, though rpi have inbuilt temperature regulaton so it will slow the perormance but it still works.

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

## Something about: custom_encrypter_v2 designs

finally I completed the hardware code for the custom_encrypter_v2, its the implemenatation of encryption algorithms that i simulated lately on the cpp under title custom_encrypter_v2,
the results are as i expected, btw that is just one layer you are seeing of encryption, I have to create a register interface that the cpu are actually comfortable with to use and use the full 16 layers
and the decrypter too, i belive making decrypter would be easy since i know the design of encrypter already, but i will take a break now, for a week maybe, i need to cover other things such as academics and assignments now.
there might be some bugs in the design that i might know, the encryption model is so easy that even a child would figure it out, but bugs are bugs. Feel free to let me know the bugs that i might have missed, i only used xoring as key-data operation
any suggestions for other kinds of operations are welcomed.

## Something about: This is the Block Diagram of the encrypter (Sequential).
<img width="1070" height="112" alt="v2" src="https://github.com/user-attachments/assets/a0715d2b-5385-47d9-b3e1-c40b220eef3b" />

## Something about: The waveform for the simulation of encrypter (Sequential).
the waves after status are actually the outputs of each layer to show they are perfectly running under procedural block.
<img width="1306" height="1061" alt="Screenshot 2025-09-20 212953" src="https://github.com/user-attachments/assets/c24e3b6f-a7a1-4e11-966e-4a3ad25356a1" />

## Something about: Decrypter Simulation Result (sequential)
<img width="653" height="533" alt="Decrypter" src="https://github.com/user-attachments/assets/34548192-a132-4a83-89f6-bf88e176043d" />
