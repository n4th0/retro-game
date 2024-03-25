
# cuestion 1
# 
# la razon es porque para almacenar una dirección de memoria solo se necesitan 32 bits
# 

# cuestión 2
# 
# si se hace f < n 
# para comparalos de menera > , lo unico que hay que hacer es 
# poner n < f
# 
# 

# cuestion 3
# 
# se realizaría en la CPU ya que la comparación
# se realiza en una resta de enteros 
# 
# 

# cuestion 4
# 
# .data
# vec: .float 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
# size: .word 10 # se podría haber guardado como float para evitar instrucciones
# suma: .float 0
# .text
# 
# la $s3, vec
# li $s0, 0
# lw $s1, size
# lw $s2, suma
# mtc1 $s2, $f2
# 
# lw $s2, size
# mtc1 $s2, $f3
# cvt.s.w $f3, $f3
# bucle:
#     l.s $f1, 0($s3)
# 
#     add.s $f2, $f1, $f2
# 
#     addi $s3, $s3, 4
# 
#     addi $s0, $s0, 1
#     bne $s1, $s0, bucle
#     
# 
# mov.s $f12, $f2
# li $v0, 2
# syscall
# 
# div.s $f5, $f2, $f3
# mov.s $f12, $f5
# li $v0, 2
# syscall
# 

# cuestion 5
# 
# .data
# Xpide: .asciiz "X = "
# Npide: .asciiz "n = "
# powRes: .asciiz "X^n = "
# 
# .text
# la $a0, Xpide
# li $v0,4
# syscall
# 
# li $v0, 6
# syscall
# 
# la $a0, Npide
# li $v0,4
# syscall
# 
# li $v0,5
# syscall
# 
# mov.s $f12,$f0
# move $a0,$v0
# 
# jal pow
# 
# fin:
# la $a0,powRes
# li $v0,4
# syscall
# 
# mov.s $f12,$f0
# li $v0,2
# syscall
# 
# li $v0,10
# syscall
# 
# pow:
#     li $t0, 0
#     li $t1, 1
#     mtc1 $t1, $f13
#     cvt.s.w $f13, $f13
# 
#     bucle:
#         mul.s $f13, $f13, $f12
#         addi $t0, $t0, 1
#         bne $a0, $t0, bucle
#     
#     mov.s $f0, $f13
#     j fin
# 

# cuestion 6
# 
# .data
# Xpide: .asciiz "X = "
# Ypide: .asciiz "Y = "
# MaxRes: .asciiz "El mayor es "
# 
# .text
# la $a0, Xpide
# li $v0,4
# syscall
# 
# li $v0,6
# syscall
# 
# mov.s $f12,$f0
# 
# la $a0, Ypide
# li $v0,4
# syscall
# 
# li $v0,6
# syscall
# 
# mov.s $f14,$f0
# 
# jal max
# 
# fin:
# la $a0,MaxRes
# li $v0,4
# syscall
# 
# mov.s $f12,$f0
# 
# li $v0,2
# syscall
# 
# li $v0,10
# syscall
# 
# max:
#     c.lt.s $f12, $f14
#     mov.s $f0, $f14
#     bc1t fin
#     mov.s $f0, $f12
# 
#     jr $ra
