.text 
li   s1,  3333
li   s2,  -66666 
li t0, 0                       # M?c ??nh không có tràn s? 
add s3, s1, s2            # s3 = s1 + s2 
xor t1, s1, s2             # Ki?m tra s1 v?i s2 có cùng d?u 
blt t1, zero, EXIT     # N?u t1 là s? âm, s1 và s2 khác d?u 
xor t2,s3,s1 
blt t2,zero, OVERFLOW 
j EXIT 
OVERFLOW: 
li t0, 1                       # The result is overflow 
EXIT:
