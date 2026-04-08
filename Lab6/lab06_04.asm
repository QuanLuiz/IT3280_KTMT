.data
A: .word 7, -2, 5, 1, 5, 6, 7, -1, 6, 8, 3, 9, 10, 37
Aend: .word
space: .asciz " "
newline: .asciz "\n"
.text
main:
 la a0, A # Địa chỉ A[0]
 la a1, Aend # Địa chỉ A[n]
 j insertion_sort
after_sort:
 li a7, 10
 ecall
done:
 j print_array
# --------------------------------------------------------------
# Hàm: Sắp xếp chèn (Insertion Sort)
# Các thanh ghi sử dụng:
# a0: Con trỏ đến đầu mảng
# a1: Con trỏ đến cuối mảng
# t0: Con trỏ phần tử hiện tại (i)
# t1: Giá trị A[i]
# t2: Con trỏ phần tử trước đó (j)
# t3: Giá trị A[j]
# s0, s1: Lưu trữ tạm
# --------------------------------------------------------------
insertion_sort:
 la t0, A # Khởi tạo con trỏ t0 đến đầu mảng
 addi t0, t0, 4 # Bắt đầu từ phần tử thứ 2 (i=1)
 la a3, A
 la a4, Aend
 addi a4, a4, -4
loop1:
 bge t0, a1, done # Nếu đã duyệt hết mảng -> kết thúc
 lw t1, 0(t0) # A[i]
 addi t2, t0, -4 # j = i-1
loop2:
 blt t2, a0, insert # j<0 thì chèn
 lw t3, 0(t2) # A[j]
 ble t3, t1, insert # A[j] <= A[i] thì chèn

 sw t3, 4(t2) # Dịch A[j] sang phải (A[j+1] = A[j])
 addi t2, t2, -4 # j--
 j loop2
insert:
 sw t1, 4(t2)
 mv s0, a0 # Backup con trỏ đầu mảng
continue:
 mv a0, s0 # Khôi phục con trỏ đầu
 addi t0, t0, 4 # i++
 j loop1
print_array:

 bgt a3, a4, end_print
 li a7, 1
 lw a0, 0(a4)
 ecall
 li a7, 4
 la a0, space
 ecall
 addi a4, a4, -4
 j print_array
end_print:
 li a7, 4
 la a0, newline
 ecall
 j after_sort 