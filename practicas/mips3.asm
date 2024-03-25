.text


# cuestion 1
#
# li $t0, -2
# li $t1, 0x7FFFFFFF
# 
# subu $t2, $t0, $t1
# sub $t3, $t0, $t1 # sale desbordamiento
# 
# move $a0, $t2
# li $v0, 1
# syscall
# 
# move $a0, $t3
# li $v0, 1
# syscall
#

# cuestion 2
#
# li $t0, 5
# addi $t1, $t0, 10
# subi $t2, $t1, 30
# 
# move $a0, $t0
# li $v0, 1
# syscall
# 
# move $a0, $t1
# li $v0, 1
# syscall
# 
# move $a0, $t2
# li $v0, 1
# syscall
# $t2 es -15, consultar con el profesor
#

# cuestion 3
#
# li $v0, 12
# syscall
# 
# move $t0, $v0 
# 
# li $a0, '\n'
# li $v0, 11
# syscall
# 
# move $a0, $t0
# li $v0, 11
# syscall

# cuestion 4
#
# li $a0, '>' # se puede cambiar a lo que se quiera 
# li $v0, 11
# syscall
#  
# li $v0, 12
# syscall
# 
# move $t0, $v0
# 
# li $a0, '\n'
# li $v0, 11
# syscall
# 
# move $a0, $t0
# li $v0, 11
# syscall

# cuestion 5
#
# li $v0, 12
# syscall
# 
# move $a0, $v0
# li $v0, 34
# syscall

# cuestion 6
#
# li $v0, 5
# syscall
# 
# move $a0, $v0
# 
# li $v0, 11
# syscall

# cuestion 7
#
# tiene la direccion 0x00400020
#


# cuestion 8
#
# li $v0, 12
# syscall
# 
# move $t0, $v0
# 
# li $a0, '\n'
# li $v0, 11
# syscall
# 
# addi $a0, $t0, 32
# li $v0, 11
# syscall
# 
# li $a0, '\n'
# li $v0, 11
# syscall

# cuestion 9
#
# eti1:   li $v0, 12
#         syscall
#         
#         move $t0, $v0
#         
#         li $a0, '\n'
#         li $v0, 11
#         syscall
#         
#         addi $a0, $t0, 32
#         li $v0, 11
#         syscall
#         
#         li $a0, '\n'
#         li $v0, 11
#         syscall
#         j eti1

# cuestion 10
#
# eti1:   li $v0, 12
#         syscall
#         
#         move $t0, $v0
#         
#         li $a0, '\n'
#         li $v0, 11
#         syscall
#         
#         addi $a0, $t0, -48
#         li $v0, 1
#         syscall
#         
#         li $a0, '\n'
#         li $v0, 11
#         syscall
