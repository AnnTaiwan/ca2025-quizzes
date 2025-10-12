# CA2025 Quizzes & [Assignment 1: RISC-V Assembly and Instruction Pipeline](https://hackmd.io/@sysprog/2025-arch-homework1)

Transform c code in [Quiz1 of Computer Architecture (2025 Fall)](https://hackmd.io/@sysprog/arch2025-quiz1-sol) Problem B & C into RISC-V32 assembly code.

## My Contributions in Assignment 1

* **RISC-V Assembly Implementations**: Handwritten assembly solutions for **Problem B & C**, including:
  * Problem B: `q1-uf8_rv32_mine_v1.s`
  * Problem C: `q1-bfloat16_rv32_mine_v1.s`

## Repository Structure
* `debug_rv32`: This directory contains RISC-V 32-bit assembly code files related to the bfloat16 format. These files include debug print statements and are organized sequentially to reflect the development process.
* **`*_rv32.s`**: RISC-V32 assembly implementation **from compiler**.

* **`*_x86-64.s`**: x86-64 assembly implementation **from compiler**.

* **`q1-bfloat16_rv32_mine_v1.s`**: Handwritten RISC-V assembly solution for the bfloat16 conversion quiz.

* **`q1-uf8_rv32_mine_v1.s`**: Handwritten RISC-V assembly solution for the UTF-8 encoding quiz.

* **`q1-vector.c`**: C language implementation for the vector operations quiz.

* **`q1-bfloat16.c`**: C language implementation for the bfloat16 conversion quiz.
* **`q1-bfloat16_fix.c`**: comment some lines in order to be compiled successfully in to `q1-bfloat16_rv32.s`
* **`q1-uf8.c`**: C language implementation for the UTF-8 encoding quiz.

* **`q1-uf8_fix.c`**: comment some lines in order to be compiled successfully in to `q1-uf8_rv32.s`
* **`Makefile`**: Build automation file for compiling and running the quizzes.

* **`LICENSE`**: MIT License for open-source distribution and usage.

## How to Use

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/AnnTaiwan/ca2025-quizzes.git
   cd ca2025-quizzes
   ```

2. **Build the Quizzes**:
* build `.exe`
   ```bash
   make all 
   ```
* build `*_x86-64.s` (I use `gcc -S` in Ubuntu24.04 or windows.)
   ```bash
   make assembly_x86-64
   ```
* build `*_rv32.s` (I use `riscv64-unknown-elf-gcc` in Ubuntu24.04.)
   ```bash
   make assembly_rv32
   ```
* build `*_rv64.s` (I use `riscv64-linux-gnu-gcc` in Ubuntu24.04.)
    * This still needs to be fixed because it can't compile successfully in my environment.
   ```bash
   make assembly_rv64
   ```
3. **Run a Specific Quiz.exe**:

   ```bash
   ./q1-bfloat16
   ```
4. **Run `*_mine_v1.s` in [Ripes simulator](https://ripes.me/).**