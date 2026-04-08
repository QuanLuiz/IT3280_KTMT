.data 
     A: .word 1, 3, 2, 5, 4, 7, 8, -9, 6 
.text 
     la s2, A                 # ??a ch? c? s? c?a m?ng A 
     li s3, 9                  # s? ph?n t? c?a m?ng A 
     li s4, 1                  # b??c nh?y 
     li s1, 1                  # i = 1 
     add t1, t1, s2        # t1 store the address of A[0] 
     lw t0, 0(t1)          # load value of A[0] in t0 
     add s5, s5,t0        # Gán max = A[0] 
loop: 
     bge zero, s3, endloop         # if 0 >= n then end loop 
     bge s1, s3, endloop            # if i >= n then end loop 
     add t1, s1, s1                     # t1 = 2 * s1 
     add t1, t1, t1                     # t1 = 4 * s1 => t1 = 4*i 
     add t1, t1, s2                    # t1 store the address of A[i] 
     lw t0, 0(t1)                      # load value of A[i] in t0 
     blt t0, zero, doi_dau        # if A[i]<0 nh?y ??n doi_dau
     add a1, zero, t0
     blt s6, t0, findmax_duong     # if max<A[i] nh?y ??n findmax
     add s1, s1, s4                         # i = i + step 
     j loop                                     # go to loop
doi_dau: 
     add a0,zero,t0                          # Gán s? âm vào bi?n trung gian 
     sub a1,zero,t0 
     blt s5, a1, findmax_am            # if max<A[i] nh?y ??n findmax
     add s1, s1, s4                           # i = i + step 
     j loop                                       # go to loop 
findmax_duong: 
     addi s5,t0,0               #Gán max m?i vào thanh ghi max 
     addi s6,t0,0 
     add s1, s1, s4            # i = i + step 
     j loop 
findmax_am: 
     addi s5,a0,0             #Gán max m?i vào thanh ghi max 
     addi s6,a1,0 
     add s1, s1, s4           # i = i + step 
     j loop 
endloop:
