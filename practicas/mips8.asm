
# cuestion 1
# 
# no hay instrucciones inmediatas ya que la instrucción tiene como máximo 32 bits 
# y para se requieren 32 bits para almacenar un dato en los registros FPU
# 
# 

# cuestion 2
# 
# se debe a que con 32 bits de guardado es suficiente para guardar el valor numérico 
# completo  
# 

# cuestion 3
# 
# mtc1 $zero, $f16
# 

# cuestion 4
# 
# li $t0, 1
# mtc1 $t0, $f1
# cvt.s.w $f1, $f1
# 
# li $t0, -2
# mtc1 $t0, $f2
# cvt.s.w $f2, $f2

# cuestion 5
# 
# .data
# mmask: .word 0x007FFFFF
# emask: .word 0x7F800000
# exp1: .word 255
# mensaje: .asciiz "hay overflow"
# 
# .text
# li $s0, 1
# sll $s0, $s0 30
# mtc1 $s0, $f0
# cvt.s.w $f0, $f0
# mul.s $f0, $f0, $f0
# mul.s $f0, $f0, $f0
# mul.s $f0, $f0, $f0
# 
# mfc1 $s0, $f0
# lw $t4, mmask
# and $t0, $s0, $t4
# lw $t4, emask
# and $t2, $s0, $t4
# srl $t2, $t2, 23
# 
# 
# lw $t3, exp1
# beq $t2, $t3, exp_a_1
# 
# fin:
#         li $v0, 10
#         syscall
# 
# exp_a_1: la $a0, mensaje
#          li $v0, 4
#          syscall
#          j fin
# 

# cuestion 6
# 
# .data
# mmask: .word 0x007FFFFF
# emask: .word 0x7F800000
# signo: .word 0x80000000
# exp1: .word 0x000000FF
# NotaNum: .asciiz "Not a Number\n"
# infinitoMas: .asciiz "+infinito\n"
# infinitoMenos: .asciiz "-infinito\n"
# mas0: .asciiz "es +0\n"
# menos0: .asciiz "es -0\n"
# desnorm: .asciiz "desnormalizado\n"
# 
# 
# .text
# 
# # aqui el que se va a comprobar
# li $s0, 0xFF800000
# lw $t4, mmask
# and $t0, $s0, $t4
# beqz $t0, ceroOinfinito
# 
# lw $t4, emask
# and $t2, $s0, $t4
# beqz $t2, desnormalizado
# 
# la $a0, NotaNum
# li $v0, 4
# syscall
# 
# fin:
#         li $v0, 10
#         syscall
# 
# desnormalizado:
#         la $a0, desnorm
#         li $v0, 4
#         syscall
#         j fin
# 
# ceroOinfinito:
#         lw $t4, emask
#         and $t2, $s0, $t4
#         beqz $t2, cero
#         lw $t4, signo
#         and $t2, $s0, $t4
#         beqz $t2, infinitoPositivo
#         la $a0, infinitoMenos
#         li $v0, 4
#         syscall
#         j fin
# infinitoPositivo:
#         la $a0, infinitoMas
#         li $v0, 4
#         syscall
#         j fin
# cero:
#         lw $t4, signo
#         and $t2, $s0, $t4
#         beqz $t2, ceroPositivo
#         la $a0, menos0
#         li $v0, 4
#         syscall
#         j fin
# ceroPositivo:
#         la $a0, mas0
#         li $v0, 4
#         syscall
#         j fin

# cuestion 7
# 
# .data
# pedirPi:.asciiz "dame el valor de pi: "
# pideRadio:.asciiz "dame el valor del radio: "
# Longitud:.asciiz "la longitud de la circunferencia es: "
# Superficie:.asciiz "\nel área del circulo es: "
# .text
# 
# la $a0, pedirPi
# li $v0, 4
# syscall
# 
# li $v0, 6
# syscall
# 
# mov.s $f1, $f0
# 
# li $v0, 4 
# la $a0, pideRadio
# syscall
# 
# li $v0, 6
# syscall
# li $v0, 4
# la $a0, Longitud
# syscall
# 
# mul.s $f3, $f0, $f1
# add.s $f4, $f3, $f3
# mov.s $f12, $f4
# 
# li $v0, 2
# syscall
# 
# mul.s $f3, $f0, $f0
# mul.s $f3, $f3, $f1
# 
# mov.s $f12, $f3
# 
# li $v0, 4
# la $a0, Superficie
# syscall
# 
# li $v0, 2
# syscall
# 
# li $v0, 10
# syscall

# cuestion 8
# 
# .data
# array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
# long: .word 10
# suma: .word 0
# frase: .asciiz "media: "
# 
# .text
# la $t1, array
# li $t2, 10
# li $t3, 0
# 
# bucle_suma:
# 
#     lw $t0, 0($t1)
#     lw $t4, suma
#     add $t4, $t4, $t0
#     sw $t4, suma
# 
#     addi $t3, $t3, 1
#     addi $t1, $t1, 4
#     bne $t2, $t3, bucle_suma
#     
# lw $t0, suma
# mtc1 $t0, $f0
# 
# cvt.s.w $f0, $f0
# 
# lw $t0, long
# mtc1 $t0, $f1
# cvt.s.w $f1, $f1
# 
# div.s $f12, $f0, $f1
# la $a0, frase
# li $v0, 4
# syscall
# 
# li $v0, 2
# syscall
# 
