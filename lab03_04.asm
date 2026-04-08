.text 
start: 
     li s1,3    #kh?i t?o giá tr? i 
     li s2,4    #kh?i t?o giá tr? j 
     li t1,1    #kh?i t?o giá tr? x 
     li t2,1    #kh?i t?o giá tr? y 
     li t3,1    #kh?i t?o giá tr? z 
#Câu d 
      add s3, s1, s2    #s3=i+j 
     li t4, 1                  #kh?i t?o giá tr? m 
     li t5, 1                  #kh?i t?o giá tr? n 
     add s4, t4, t5        #s4=m+n 
     bge s4, s3, else     #i+j>m+n => i+j<=m+n nh?y t?i else 
then: 
     addi t1, t1, 1         # x=x+1 
     addi t3, zero, 1     # z=1 
     j endif                  # nh?y ??n endif 
else: 
     addi t2, t2, -1      # y=y-1 
     add t3, t3, t3       # z=2*z 
endif:



