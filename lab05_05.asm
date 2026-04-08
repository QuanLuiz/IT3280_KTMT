.data 
     string:   .space 21      # 20 ky tu + NULL 
     msg1: .asciz              "Nhap xau: " 
     msg2: .asciz              "\nXau sau khi dao: " 
.text 
main: 
get_string: 
# Thong bao nhap xau 
     la a0, msg1 
     li a7, 4 
     ecall                         # syscall 4: in chuoi 

# Nhap chuoi tu ban phim 
     la a0, string 
     li a1, 21 
     li a7, 8                       # syscall 8: doc chuoi 
     ecall

remove_newline: 
# Xoa '\n' 
     la a0, string 
     li t0, 0                       # t0 = do dai xau 

get_length: 
     la a0, string 
     li t0, 0                        # t0 = i = 0 
check_char: 
     add t1, a0, t0 
     lb t2, 0(t1) 
     beq t2, zero, end_of_str          # if NULL end 
     li t3, 10                                   # '\n' = 10 
     beq t2, t3, replace_newline  
     addi t0, t0, 1                            # i += 1 
     j check_char 
replace_newline:
      sb zero, 0(t1)                         # Set NULL '\n' 
end_of_str: 
reverse_string: 
# Dao chuoi 
     la a0, string 
     addi t1, t0, -1                         # t1 = end = length - 1 
     li t2, 0                                    # t2 = start = 0 

reverse_loop: 
     bge t2, t1, print_reversed        # if start >= end dung 

# start 
     add t3, a0, t2 
     lb t4, 0(t3) 

# end 
     add t5, a0, t1 
     lb t6, 0(t5)
# Hoan doi 
     sb t6, 0(t3) 
     sb t4, 0(t5) 

# Tiep tuc
     addi t2, t2, 1 
     addi t1, t1, -1
     j reverse_loop 

print_reversed: 
     la a0, msg2 
     li a7, 4 
     ecall 

# In chuoi 
     la a0, string
     li a7, 4 
     ecall
