/* -- preindexing.s */
.data
values: .word 100, 200, 300

.text
.global main
main:
    ldr r0, =values
    
    @ Mode 1: [Rbase, #±immediate]!
    ldr r1, [r0, #4]!    @ r0 +=4 first, then r1=200
    
    @ Mode 2: [Rbase, ±Roffset]!
    mov r2, #4
    ldr r3, [r0, r2]!    @ r0 +=4 first, then r3=300
    
    @ Mode 3: [Rbase, ±Roffset, shift]!
    mov r4, #1
    ldr r5, [r0, r4, LSL #2]! @ r0 +=4 first, then r5=0 (out of bounds)
    
    bx lr
