# Ch??ng trình: C?ng hai s? và in k?t qu?
# H??ng d?n: M? trong RARS -> Nh?n F3 (Assemble) -> Nh?n F5 (Run)

.data
    prompt:  .asciz "Tong cua 10 + 20 la: "
    newline: .asciz "\n"

.text
.globl main

main:
    # 1. Gán giá tr? vào các thanh ghi
    li t0, 10          # t0 = 10
    li t1, 20          # t1 = 20
    
    # 2. Th?c hi?n phép c?ng
    add t2, t0, t1     # t2 = t0 + t1 (k?t qu? là 30)
    
    # 3. In chu?i thông báo (System Call 4)
    la a0, prompt      # N?p ??a ch? c?a chu?i prompt vào a0
    li a7, 4           # Mã h? th?ng ?? in string là 4
    ecall              # G?i h? th?ng
    
    # 4. In k?t qu? s? nguyên (System Call 1)
    mv a0, t2          # Chuy?n k?t qu? t? t2 sang a0 ?? in
    li a7, 1           # Mã h? th?ng ?? in integer là 1
    ecall              # G?i h? th?ng
    
    # 5. In dòng m?i
    la a0, newline
    li a7, 4
    ecall

    # 6. Thoát ch??ng trình (System Call 10)
    li a7, 10
    ecall