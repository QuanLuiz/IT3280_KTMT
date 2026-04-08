.text 
start: 
     li s1,3    #kh?i t?o giá tr? i 
     li s2,4    #kh?i t?o giá tr? j 
     li t1,1    #kh?i t?o giá tr? x 
     li t2,1    #kh?i t?o giá tr? y 
     li t3,1    #kh?i t?o giá tr? z 
     blt s2, s1, else    # if j < i then jump else 
then: 
     addi t1, t1, 1        # x=x+1 
     addi t3, zero, 1    # z=1 
     j endif                 # nh?y ??n endif 
else: 
     addi t2, t2, -1     # y=y-1
     add t3, t3, t3       # z=2*z 
endif:

