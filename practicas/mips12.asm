
# cuestion 1
# 
# necesitará (son 10 dígitos 0-9, y por cada uno necesitará un byte), 3 palabras para mostrar todos los digitos
# 

# cuestion 2
# 
# .data
# bcd: .byte 0x3F, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f # vector con caracteres a mostrar en el display
# .text
# 
# li $s0, 0xFFFF0010 # Dirección base del display derecho
# li $s1, 0xFFFF0011 # Dirección base del display izquierdo
# la $s3, bcd # Dirección base del vector A 
# li $s5, 10 # Tamaño del vector
# li $t2, 0xbf
# sb $t2, 0($s1)
# loop2:
#     li $t0, 0 # indice del vector a 0
#     loop:
# 
#         add $t1, $s3, $t0
#         lb $t3, 0($t1)
#         sw $t3, 0($s0)
#         addi $t0, $t0, 1
#         bne $s5, $t0, loop
# 
#         # lo pide por consola, hacerlo por teclado resultaría bastante más complejo (preguntar en clase)
#         li $v0, 12
#         syscall
#         subi $v0, $v0, 'f'
#         beqz $v0, fin
# 
# j loop2
# 
# fin:
# li $v0, 10 # acaba el programa
# syscall
# 

# cuestion 3
# 
# 0101 1011 5B 2
# 0100 1111 4f 3
# 0110 0110 66 4
# 0110 1101 6d 5
# 0111 1101 7d 6
# 0000 0111 07 7
# 0111 1111 7f 8 
# 0110 1111 6f 9
# 0111 0111 77 a
# 0111 1100 7c b
# 0011 1001 39 c
# 0101 1110 5e d
# 0111 1001 79 e
# 0111 0001 71 f
# 
# .data
# bcd: .byte 0x3F, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f, 0x77, 0x7c, 0x39, 0x5e, 0x79, 0x71 # vector con caracteres a mostrar en el display 
# .text
# 
# li $s0, 0xFFFF0010 # Dirección base del display derecho
# li $s1, 0xFFFF0011 # Dirección base del display izquierdo
# la $s3, bcd # Dirección base del vector A 
# la $s4, bcd # Dirección base del vector A 
# li $s5, 16 # Tamaño del vector
# li $t2, 0xbf
# 
# sb $t2, 0($s1)
# 
# li $t4, 0
# 
# 
# loop2:
#     loop3:
#     addi $t4, $t4, 1
#     li $t0, 0 # indice del vector a 0
#         loop:
# 
#             add $t1, $s3, $t0
#             lb $t3, 0($t1)
#             sw $t3, 0($s0)
# 
#             lb $t3, 0($s4)
# 
#             sb $t3, 0($s1)
# 
#             addi $t0, $t0, 1
#             bne $s5, $t0, loop
#             addi $s4, $s4, 1
# 
#     bne $t4, $s5, loop3
# 
#     # lo pide por consola, hacerlo por teclado resultaría bastante más complejo (preguntar en clase)
#     li $v0, 12
#     syscall
#     subi $v0, $v0, 'f'
#     beqz $v0, fin
#     li $t4, 0
# 
# subi $s4, $s4, 16
# j loop2
# 
# fin:
# li $v0, 10 # acaba el programa
# syscall

# cuestion 4
# 
# .data
# bcd: .byte 0x3F, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f, 0x77, 0x7c, 0x39, 0x5e, 0x79, 0x71 # vector con caracteres a mostrar en el display 
# .text
# li $v0, 5
# syscall
# 
# li $t1, 255
# 
# bgt $v0, $t1, fin
# 
# li $t0, 16
# div $v0, $t0
# 
# mflo $t0
# mfhi $t1
# 
# li $s0, 0xFFFF0010 # Dirección base del display derecho
# li $s1, 0xFFFF0011 # Dirección base del display izquierdo
# la $t3, bcd
# add $t0, $t3, $t0
# add $t1, $t3, $t1
# 
# lb $t0, 0($t0)
# lb $t1, 0($t1)
# 
# sb $t0, 0($s1)
# sb $t1, 0($s0)
# 
# fin:
# li $v0, 10
# syscall
