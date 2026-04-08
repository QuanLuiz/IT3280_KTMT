# Laboratory Exercise 4, Home Assignment 1
.text
	li s1,-9999999999
	li s2,1111111111 
	# 3 truong hop, tran 2 duong, tran 2 am, khong 
# Thuat toán xác dinh tràn so ?
	li t0, 0 # M?c ??nh không có tràn s?
	add s3, s1, s2 # s3 = s1 + s2
	xor t1, s1, s2 # Ki?m tra s1 v?i s2 có cùng d?u
	blt t1, zero, EXIT # N?u t1 là s? âm, s1 và s2 khác d?u
	blt s1, zero, NEGATIVE # Ki?m tra s1 và s2 là s? âm hay không âm
	bge s3, s1, EXIT # s1 không âm, ki?m tra s3 nh? h?n s1 không
# N?u s3 >= s1, không tràn s?
	j OVERFLOW
NEGATIVE:
	bge s1, s3, EXIT # s1 âm, ki?m tra s3 có l?n h?n s1 không
# N?u s1 >= s3, không tràn s?
OVERFLOW:
	li t0, 1 # The result is overflow
EXIT: