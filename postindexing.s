/* -- postindexing.s */
.data
arr: .word 10, 20, 30, 40

.text
.global main
main:
    ldr r0, =arr         @ r0 = base address
    
    @ Mode 1: [Rbase], #±immediate
    ldr r1, [r0], #4     @ r1=10, then r0 += 4
    
    @ Mode 2: [Rbase], ±Roffset
    mov r2, #4
    ldr r3, [r0], r2     @ r3=20, then r0 += 4
    
    @ Mode 3: [Rbase], ±Roffset, shift
    mov r4, #1
    ldr r5, [r0], r4, LSL #2 @ r5=30, then r0 += 4
    
    bx lr
