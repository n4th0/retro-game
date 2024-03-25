

.data
pregunta1: .asciiz "Dime el primer valor > "
pregunta2: .asciiz "Dime el segundo valor> "
num1: .space 4
num2: .space 4

.text

la $a0, pregunta1
li $v0, 4
syscall

li $v0, 5
syscall

move $s0, $v0

la $a0, pregunta2
li $v0, 4
syscall

li $v0, 5
syscall

move $s1, $v0

sw $s0, num1
sw $s1, num2

lw $a0, num1
lw $a1, num2

j swap

swap:
    la $t0, num1
    la $t1, num2
    lw $t2, num1
    lw $t3, num2

    sw $t2, 0($t1)
    sw $t3, 0($t0)
    j com

com:
    bgt $a0, $a1, b
    j a

a:  
    li $v0, 1
    syscall

    move $a0, $a1
    li $v0, 1
    syscall
    j fin

b:
    move $t0, $a0
    move $a0, $a1
    li $v0, 1
    syscall
    move $a0, $t0
    li $v0, 1
    syscall
    j fin

fin:
    li $v0, 10
    syscall


# cuestion 1
# 
# está en la direccion 0x10010027
# 
# 

# cuestion 2
# 
# 
# 6 instrucciones de acceso
# 
# 3 bytes de memoria
# 

# cuestion 3
# 
# tiene la direccion de B que es 0x10010004
# se guardará en el registro s1
# 

# cuestion 4
# 
# da un error ya que se está accediendo a una parte de la memoria que no ha sido 
# asignada en ningún momento. 

# cuestion 5
# 
# lw $s1,0($t1)
# 
# 0x8d310000
# 1000 1101 0011 0001 0000 0000 0000 0000
# 
# 100011 01001 10001 0000000000000000 
# 

# cuestion 6
# 
# 0x0000000c
# 

# cuestion 7
#
# .data
# pregunta1: .asciiz "Dime el primer valor > "
# pregunta2: .asciiz "Dime el segundo valor> "
# num1: .space 4
# num2: .space 4
# 
# .text
# 
# la $a0, pregunta1
# li $v0, 4
# syscall
# 
# li $v0, 5
# syscall
# 
# move $s0, $v0
# 
# la $a0, pregunta2
# li $v0, 4
# syscall
# 
# li $v0, 5
# syscall
# 
# move $s1, $v0
# 
# sw $s0, num1
# sw $s1, num2
# 

# cuestion 8
# 
# .data
# pregunta1: .asciiz "Dime el primer valor > "
# pregunta2: .asciiz "Dime el segundo valor> "
# num1: .space 4
# num2: .space 4
# 
# .text
# 
# la $a0, pregunta1
# li $v0, 4
# syscall
# 
# li $v0, 5
# syscall
# 
# move $s0, $v0
# 
# la $a0, pregunta2
# li $v0, 4
# syscall
# 
# li $v0, 5
# syscall
# 
# move $s1, $v0
# 
# sw $s0, num1
# sw $s1, num2
# 
# lw $a0, num1
# lw $a1, num2
# 
# bgt $a0, $a1, b
# j a
# 
# j fin
# a:  
#     li $v0, 1
#     syscall
# 
#     move $a0, $a1
#     li $v0, 1
#     syscall
#     j fin
# 
# b:
#     move $t0, $a0
#     move $a0, $a1
#     li $v0, 1
#     syscall
#     move $a0, $t0
#     li $v0, 1
#     syscall
#     j fin
# 
# fin:
#     li $v0, 10
#     syscall

