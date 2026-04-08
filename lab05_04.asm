.data 
     string: .space 50
     msg1: .asciz  "Nhap xau: "
     msg2: .asciz  "Do dai xau la: "
.text 
main:
get_string:
     li a7, 54
     la a0, msg1
     la a1, string
     li a2, 50
     ecall
get_length:
     la a0, string   #a0 = address(string[0])
     li t0, 0        #t0 = i = 0
     li x1, 10       # ASCII '\n' = 10
check_char:
     add t1, a0, t0  #t1 = a0 + t0 =  address(string[0] + 1)
     lb t2, 0(t1)    #t2 = string[i]
     beq t2, zero, end_of_str  #Neu la ki tu NULL thi ket thuc
     addi t0, t0, 1            #t0 = t0 + 1 -> i = i + 1
j check_char
end_of_str:
end_of_get_length:
print_length:
     li a7,56
     la a0,msg2 #In ket qua ra man hinh
     mv a1,t0
     ecall    
     