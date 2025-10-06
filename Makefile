all:
	gcc -Wall -O2 -o q1-vector q1-vector.c
	gcc -Wall -O2 -o q1-uf8 q1-uf8.c
	gcc -Wall -O2 -o q1-bfloat16 q1-bfloat16.c
assembly_x86-64:
	gcc -S q1-vector.c -o q1-vector_x86-64.s
	gcc -S q1-uf8.c -o q1-uf8r_x86-64.s
	gcc -S q1-bfloat16.c -o q1-bfloat16r_x86-64.s
assembly_risc-v32:
	gcc -S q1-vector.c -o q1-vector_risc-v32.s
	gcc -S q1-uf8.c -o q1-uf8r_risc-v32.s
	gcc -S q1-bfloat16.c -o q1-bfloat16r_risc-v32.s
clean:
	rm -f q1-vector q1-uf8 q1-bfloat16 *.s
