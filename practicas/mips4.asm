.text

# cuestion 1
#
# li $t0, 0x00000002
# ror $t1, $t0, 3
# sll $1, $8, 27
# srl $9, $8, 5
# or $9, $9, $1
# li $t2, 0x00000002
# rol $t3, $t2, 3
# srl $1, $10, 27
# sll $11, $10, 3
# or $11, $11, $1

# cuestion 2
#
#
# sll $t2, $t1, 3
# 0x000950c0
#  0000 0000 0000 1001 0101 0000 1011 0000
#  000000 00000 01001 01010 00010 110000
# srl $t2, $t1, 7
# 0x000951c2
# 0000 0000 0000 1001 0101 0001 1011 0010
# 000000 00000 01001 01010 00110 110010
# srl $t5, $t2, 9
# 0x000a6a42 
# 0000 0000 0000 1010 0110 1001 0100 0010
# 000000 00000 01011 01101 00101 000010
# 

# cuestion 3
#
# li $t1, 1215261793
# 
# srl $a0, $t1, 24
# li $v0, 11
# syscall
# 
# srl $a0, $t1, 16
# li $v0, 11
# syscall
# 
# srl $a0, $t1, 8
# li $v0, 11
# syscall
# 
# move $a0, $t1
# li $v0, 11
# syscall


# cuestion 4
#
# li $a0, '>'
# li $v0, 11
# syscall
#
# li $v0, 5
# syscall
# 
# move $a0, $v0
# jal sum
# jal imprim
# 
# 
# imprim:
#     li $v0, 1
#     syscall
#     li $a0, '\n'
#     li $v0, 11
#     syscall
#     j fin
# 
# sum: 
#     add $a0, $a0, $a0
#     add $a0, $a0, $a0
#     jr $ra
# 
# fin:
#     li $v0, 10
#     syscall

# cuestion 5
# 
# li $a0, '>'
# li $v0, 11
# syscall
# 
# li $v0, 5
# syscall
# 
# move $a0, $v0
# jal sum # el parametro de entrada es a0 
# move $a0, $v0
# jal imprim # el parametro de entrada es a0 
# 
# 
# imprim:
#     li $v0, 1
#     syscall
#     li $a0, '\n'
#     li $v0, 11
#     syscall
#     j fin
# 
# sum: 
#     add $a0, $a0, $a0
#     add $v0, $a0, $a0
#     jr $ra
# 
# fin:
#     li $v0, 10
#     syscall
# 

# cuestion 6
#
# li $a0, '>'
# li $v0,11
# syscall
# 
# li $v0,5
# syscall #Leer un entero
# 
# move $a0, $v0 #parámetro a pasar en $a0
# 
# jal mult4 #llamamos a la función mult4
# 
# move $a0, $v0
# 
# jal imprim #Llamamos a la función imprim
# 
# li $v0,10 #Acaba el programa
# syscall
# 
# imprim: addi $v0,$0,1 #función imprim
#         syscall #Escribe el valor en $a0
#         li $a0, '\n' #Salto de línia
#         li $v0,11
#         syscall
#         jr $ra #Vuelve al programa principal
# 
# mult4:  
#         move $s0, $a0
#         sll $s1, $a0, 2 #Función multiplica entero por 4
#         add $v0, $s0, $s1
# 
#         jr $ra
# 

# cuestion 7
#
# li $a0, '>'
# li $v0,11
# syscall
# 
# li $v0,5
# syscall #Leer un entero
# 
# move $a0, $v0 #parámetro a pasar en $a0
# 
# jal mult10 #llamamos a la función mult4
# 
# move $a0, $v0
# jal imprim #Llamamos a la función imprim
# 
# li $v0,10 #Acaba el programa
# syscall
# 
# imprim: addi $v0,$0,1 #función imprim
#         syscall #Escribe el valor en $a0
#         li $a0, '\n' #Salto de línia
#         li $v0,11
#         syscall
#         jr $ra #Vuelve al programa principal
# 
# mult10:  
#         move $s0, $a0
#         sll $s1, $a0, 3 #Función multiplica por 8
#         add $s2, $s1, $s0 # se le suma 2 veces el numero original
#         add $v0, $s2, $s0
# 
#         jr $ra
# 

# cuestion 8
#
# li $a0, '>'
# li $v0,11
# syscall
# 
# li $v0,5
# syscall 
# 
# move $a0, $v0 
# 
# jal mult60 
# 
# move $a0, $v0
# 
# jal imprim 
# 
# li $v0,10 
# syscall
# 
# imprim: 
#         li $v0, 1
#         syscall 
#         li $a0, '\n' 
#         li $v0,11
#         syscall
#         jr $ra 
# 
# mult60:  
#         move $s0, $a0
#         sll $s1, $a0, 6 
#         sub $s1, $s1, $s0
#         sub $s1, $s1, $s0
#         sub $s1, $s1, $s0
#         sub $v0, $s1, $s0
# 
# 
#         jr $ra
# 

# cuestion 9
# 
# li $a0, '>'
# li $v0,11
# syscall
# 
# li $v0,5
# syscall 
# 
# move $a0, $v0 
# 
# jal mult60 
# move $a0, $v0
# jal mult60 
# 
# move $a0, $v0
# jal imprim 
# 
# 
# li $v0,10 
# syscall
# 
# imprim: 
#         li $v0, 1
#         syscall 
#         li $a0, '\n' 
#         li $v0,11
#         syscall
#         jr $ra 
# 
# mult60:  
#         move $s0, $a0
#         sll $s1, $a0, 6 
#         sub $s1, $s1, $s0
#         sub $s1, $s1, $s0
#         sub $s1, $s1, $s0
#         sub $v0, $s1, $s0
# 
# 
#         jr $ra

# cuestion 10
# 
#  li $a0, '>'
#  li $v0,11
#  syscall
#  
#  li $v0,5
#  syscall 
#  
#  move $a0, $v0 
#  
#  jal mult11
#  
#  move $a0, $v0
#  
#  jal imprim 
#  
#  li $v0,10 
#  syscall
#  
#  imprim: 
#          li $v0, 1
#          syscall 
#          li $a0, '\n' 
#          li $v0,11
#          syscall
#          jr $ra 
#  
#  mult11:  
#          move $s0, $a0
#          sll $s1, $s0, 4
#          sll $s2, $s0, 3
#          sll $s3, $s0, 2
#          sll $s4, $s0, 1
# 
#          add $s1, $s1, $s3
#          add $s2, $s2, $s0
# 
#          sub $v0, $s1, $s2
#          jr $ra
#  
#

# cuestion 11
#
# li $a0, '>'
# li $v0,11
# syscall
# 
# li $v0,5
# syscall 
# 
# move $a0, $v0 
# 
# jal ec 
# 
# move $a0, $v0
# jal imprim 
# 
# 
# li $v0,10 
# syscall
# 
# imprim: 
#         li $v0, 1
#         syscall 
#         li $a0, '\n' 
#         li $v0,11
#         syscall
#         jr $ra 
# 
# ec:  
#         move $s0, $a0
#         mult $s0, $s0
#         mflo $s1
#         sll $s2, $s1, 2
#         add $s3, $s2, $s1
#         # primera parte de la ecuacion
#         sll $s4, $s0, 1
#         # segunda parte de la ecuacion
#         add $s5, $s4, $s3
#         addi $v0, $s5, 3
# 
#         jr $ra

