all:
	gcc -Wall -O2 -o q1-vector q1-vector.c
	gcc -Wall -O2 -o q1-uf8 q1-uf8.c
	gcc -Wall -O2 -o q1-bfloat16 q1-bfloat16.c
assembly_x86-64:
	gcc -S q1-vector.c -o q1-vector_x86-64.s
	gcc -S q1-uf8.c -o q1-uf8_x86-64.s
	gcc -S q1-bfloat16.c -o q1-bfloat16_x86-64.s
assembly_rv32:
	#riscv64-unknown-elf-gcc -S -march=rv32i -mabi=ilp32 -nostdlib -ffreestanding q1-vector_fix.c -o q1-vector_rv32.s
	riscv64-unknown-elf-gcc -S -march=rv32i -mabi=ilp32 -nostdlib -ffreestanding q1-uf8_fix.c -o q1-uf8_rv32.s
	riscv64-unknown-elf-gcc -S -march=rv32i -mabi=ilp32 -nostdlib -ffreestanding q1-bfloat16_fix.c -o q1-bfloat16_rv32.s
assembly_rv64:
	riscv64-linux-gnu-gcc -S -march=rv64gc -mabi=lp64 q1-vector.c -o q1-vector_rv64.s
	riscv64-linux-gnu-gcc -S -march=rv64gc -mabi=lp64 q1-uf8.c -o q1-uf8_rv64.s
	riscv64-linux-gnu-gcc -S -march=rv64gc -mabi=lp64 q1-bfloat16.c -o q1-bfloat16_rv64.s
clean:
	rm -f q1-vector q1-uf8 q1-bfloat16 *.s
