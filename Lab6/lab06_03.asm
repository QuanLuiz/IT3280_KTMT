.data
A: .word 7, -2, 5, 1, 5, 6, 7, -1, 6, 8, 3, 9, 10, 37 
Aend: .word
space: .asciz " "
newline: .asciz "\n"
.text
main:
 la a0, A # Địa chỉ của mảng A
 la a1, Aend # Địa chỉ phần tử cuối cùng của mảng A
 j bubble_sort # Nhảy đến bubble sort
after_sort:
 li a7, 10 # Thoát chương trình
 ecall
# --------------------------------------------------------------
# Hàm: Sắp xếp nổi bọt (Bubble Sort)
# Các thanh ghi sử dụng:
# a0: Con trỏ đến phần đầu mảng
# a1: Con trỏ đến phần cuối mảng
# t0: Con trỏ phần tử hiện tại
# t1: Con trỏ phần tử tiếp theo
# t2: Giá trị A[i]
# t3: Giá trị A[i+1]
# t4: Kiểm tra hoán đổi nếu = 0 thì không hoán đổi, nếu = 1 thì có hoán đổi
# --------------------------------------------------------------
bubble_sort:
 la t0, A # Địa chỉ phần đầu của mảng
 la t1, Aend
 addi t1, t1, -4 # Địa chỉ phần tử cuối cùng
loop1:
 li t4, 0 # Check hoán đổi
 la t0, A # Đặt lại con trỏ t0 về đầu mảng
inloop:
 addi t1, t0, 4 # t1 trỏ đến A[i+1]
 bge t1, a1, continue_outer # Nếu đã đến cuối(A[i]=A[n]), quay lại vòng ngoài
 lw t2, 0(t0) # Lấy A[i]
 lw t3, 0(t1) # Lấy A[i+1]
 ble t2, t3, no_swap # Nếu A[i] <= A[i+1], không đổi chỗ
 sw t3, 0(t0)
 sw t2, 0(t1) # Hoán đổi A[i] và A[i+1]
 li t4, 1 # Đánh dấu có hoán đổi
print:
 mv a0,t4
 la a3, A
 la a4, Aend
 addi a4, a4, -4
continue:
 mv t4, a0
no_swap:
 addi t0, t0, 4 # Di chuyển đến phần tử tiếp theo
 j inloop
continue_outer:
 beq t4, zero, done # Nếu không có hoán đổi, kết thúc sắp xếp
 addi a1, a1, -4 # Giảm phạm vi từ A[n] xuống A[n-1]....
 bge a0, a1, loop1 # Tiếp tục vòng lặp ngoài
done:
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