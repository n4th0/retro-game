.text


addi $t1, $zero, 0x0000FACE
xori $a0, $t1, 0x0003030
 addi $v0, $zero, 34
 syscall

# mostrado por pantalla
#
# addi $a0, $t7, 0 ---> se mueve al a0  (se muestra simpre lo que hay en a0)
# addi $v0, $zero, 1 ---> se muestra por pantalla (1, pq es int)
# syscall ---> llamada al sistema
# 
#
# pedir un número por teclado
#  addi $v0, $zero, 5 ---> (5 pq es pedir un int)
#  syscall
#
# return 0 
#  addi $v0, $zero, 10
#  syscall
# 

# cuestion 1
#
#  addi $v0, $zero, 5
#  syscall
# 
#  addi $a0, $v0, 1
# 
#  addi $v0, $zero, 1
#  syscall

# cuestion 2
#
#  addi $v0, $zero, 5
#  syscall
# 
#  addi $a0, $v0, -1
# 
#  addi $v0, $zero, 1
#  syscall
#

# cuestion 3
#
# add $t2, $t1, $t0
#
#

# cuestion 4
#
# $t2 = 20
# addiu $t0, $zero, 25
# addiu $t1, $zero, 5
# sub $t2, $t0, $t1
# 
# addi $v0, $zero, 10
# syscall
# 

# cuestion 5
# 
#  000000 01000 01001 01010 00000 100010
# 

# cuestion 6
#  
#  son 64 ya que corresponden a los 6 bits de la parte de funcion
#  


# cuestion 7
# 
# addi $t0, $zero, 5
# addi $t1, $t0, 10
# add $t2, $t0, $t1
# 
# addi $t3, $t1, -30
# 
# 
# 
# 

# cuestion 8
# 
# addi $v0, $zero, 5
# syscall
# 
# add $t0, $zero, $v0
# 
# addi $v0, $zero, 5
# syscall
# 
# add $a0, $t0, $v0
# 
# addi $v0, $zero, 1
# syscall
# 

# cuestion 9
# 
# addi $v0, $zero, 5
# syscall
# 
# add $t0, $zero, $v0
# 
# addi $v0, $zero, 5
# syscall
# 
# sub $a0, $t0, $v0
# 
# addi $v0, $zero, 1
# syscall
# 

# cuestion 10
# 
# si que se puede
# ori $t0, $zero, 10
# 
# ori $t2, $zero, 7
# 



# cuestion 11
# 
# todas las instrucciones son equivalentes en lo que el tiempo respecta
# 
# 

# cuestion 12
# 
# ori $v0, $zero, 5
# syscall
# 
# ori $a0, $v0, 0
# ori $v0, $zero, 1
# syscall
# 

# cuestion 13
# 
# or $t3, $t1, $t2
# and $t4, $t1, $t2
# xor $t5, $t1, $t2
# 
# $t3 = -1
# $t4 =  0 
# $t5 = -1
# 

# cuestion 14
# 
# 0000 0000 0000 1111 1010 1100 1110
# 
# 0000 0000 0000 0011 0000 0011 0000
# 
# 0000 0000 0000 1100 1010 1111 1110
# 
# addi $t1, $zero, 0x0000FACE
# xori $t1, $t1, 0x0003030
# 

# cuestion 15
# 
# 
# addi $t1, $zero, 0x0000FACE
# xori $t1, $t1, 0x0003030
# 
# addi $t1, $zero, 34
# syscall
# 
# 

# cuestion 16
# 
# addi $v0, $zero, 5
# syscall
# 
# add $a0, $v0, $zero
# 
# addi $v0, $zero, 35
# syscall
# 
