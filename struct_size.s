.global _start
_start:
    ldr r0, =next_label    @ Load address of next_label into r0
    ldr r1, =b             @ Load base address of struct into r1
    sub r0, r0, r1         @ Calculate size: r0 = next_label - b
    mov r7, #1             @ Syscall code for exit
    swi 0                  @ Invoke syscall (exit with r0 as status)

.data
b: .skip 8                 @ Reserve 8 bytes for the struct
next_label: .skip 0        @ Label immediately after the struct
