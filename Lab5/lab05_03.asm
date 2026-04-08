.data 
msg1:  .asciz        "Toi yeu KTMT" 
msg2:  .space        32 
.text  
la a1, msg1            #a1=&msg[0] 
li s0, 0                   #i=0 
la a0, msg2           #a0=&msg2[0] 

loop: 
add t1, a1, s0         #t1=&msg[i] 
lb s1, 0(t1)           #s1=msg[i] 
beq s1, zero, EXIT 
add t2, a0, s0 
sb s1,0(t2) 
addi s0, s0, 1 
j loop 
EXIT:
