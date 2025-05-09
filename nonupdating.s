/* -- nonupdating.s */
.data
array: .word 0, 1, 2, 3, 4 @ 5-element array

.text
.global main
main:
    ldr r0, =array       @ Load base address
    
    @ Mode 1: [Rbase, #±immediate]
    ldr r1, [r0, #8]     @ r1 = array[2] (0+8 bytes)
    
    @ Mode 2: [Rbase, ±Roffset]
    mov r2, #12
    ldr r3, [r0, r2]     @ r3 = array[3] (0+12 bytes)
    
    @ Mode 3: [Rbase, ±Roffset, shift]
    mov r4, #2
    ldr r5, [r0, r4, LSL #2] @ r5 = array[2] (0+2*4 bytes)
    
    bx lr
