.text 
li s0, 0x12345678 
srli s1, s0, 24                #Trich xuat MSB 
li t1, 0xFFFFFF00 
and s2, s0, t1                #Loai bo LSB 
ori s3, s0, 0x0FF          # Thiet lap LSB 
andi s0, s0, 0                # Xoa thanh ghi s0
