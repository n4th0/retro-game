

.data

error: .asciiz "te has equivocado, vuelve a poner los valores\n"

.text 

start:  li $a0, '>'
        li $v0, 11
        syscall

        li $v0, 5
        syscall

        move $t0, $v0

        li $a0, '>'
        li $v0, 11
        syscall
        li $v0, 5
        syscall

        move $t1, $v0
    
        bgt $t1, $t0, inicio

        la $a0, error
        li $v0, 4
        syscall

        j start

inicio:

        move $a0, $t0

        li $v0, 1
        syscall

        li $a0, '\n'
        li $v0, 11
        syscall

        addi $t0, $t0, 1

        beq $t0, $t1, fin
        j inicio
fin:
        move $a0, $t1
        li $v0, 1
        syscall
        li $v0, 10
        syscall
        


# cuestion 1
# 
# li $a0, '>'
# li $v0, 11
# syscall
# 
# li $v0, 5
# syscall
# 
# bltz $v0, else
# move $a0, $v0
# 
# j exit
# 
# else: 
#     sub $a0, $zero, $v0
# 
# exit: 
#     li $v0, 1
#     syscall
# 
#     li $v0, 10
#     syscall

# cuestion 2
# 
# li $v0, 5
# syscall
# 
# move $t0, $v0
# 
# li $v0, 5
# syscall
# 
# move $t1, $v0
# 
# bgt $t1, $t0, con
# 
# move $a0, $t0
# 
# li $v0, 1
# syscall
# j fin
# 
# con: 
#     move $a0, $t1
#     li $v0, 1
#     syscall
# 
# Fin: 
#     li $v0, 10
#     syscall

# cuestion 3
# 
# salto absoluto 
# beq $t1, $t2, Final
# 0x112a0000
# 
# 0001 0001 0010 1010 0000 0000 0000 0000 
# 000100 01001 01010 0000000000000000 
# 

# cuestion 4
# 
# salto relativo 
# slt $a0, $t1, $t0
# 0x0128202a
# 
# 0000 0001 0010 1000 0010 0000 0010 1010
# 000000 01001 01000 00100 00000 101010
# 

# cuestion 5
# 
# li $t0, 10
# li $t1, 110
# 
# sgt $a0, $t0, $t1
# 
# li $v0, 1
# syscall
# 
# sgt $a0, $t1, $t0
# 
# li $v0, 1
# syscall
# 
# li $t0, 10
# li $t1, 100
# 
# sge $a0, $t0, $t1
# li $v0, 1
# syscall
# 
# li $t1, 10
# 
# sge $a0, $t1, $t0
# li $v0, 1
# syscall
# 
# li $t0, 10
# li $t1, 100
# 
# ble $t0, $t1, prueba
# 
# li $a0, 404
# li $v0, 1
# syscall
# 
# prueba:
#         li $t1, 10
#         ble $t0, $t1, fin
#         li $v0, 1
#         syscall
# 
#         li $v0, 10
#         syscall
# fin: 
#         li $v0 10 
#         syscall
# 

# cueston 6
# 
# li $t0, -1
# 
# li $t1,  1
# 
# slt $a0, $t1, $t0
# li $v0, 1
# syscall
# 
# sltu $a0, $t1, $t0
# li $v0, 1
# syscall
# 

# cuestion 7
#
# li $s0, 1
# li $s1, 11
# li $s2, 0
# inicio_while: 
#               add $s2, $s2, $s0
#               addi $s0, $s0, 1
#               sle $t1, $s0, $s1
#               beqz $t1, final
#               j inicio_while
# final:  

# cuestion 8
# 
# inicio_while: 
#               li $a0, '>'
#               li $v0, 11
#               syscall
# 
#               li $v0, 5
#               syscall
# 
#               move $t0, $v0
# 
#               beq $t0, $zero, final
# 
#               add $t1, $t1, $t0
# 
#               move $a0, $t1
# 
#               li $v0, 1
#               syscall
# 
#               li $a0, '\n'
#               li $v0, 11
#               syscall
# 
#               
#               j inicio_while
# final:  
#               li $v0, 10
#               syscall
#         

# cuestion 9
# 
# seguir:
#         li $a0, '>'
#         li $v0, 11
#         syscall
# 
#         li $v0, 5
#         syscall
# 
#         move $t0, $v0
# 
#         li $a0, '>'
#         li $v0, 11
#         syscall
# 
#         li $v0, 5
#         syscall
# 
#         move $t1, $v0
# 
#         add $t1, $t1, $t0
#         move $a0, $t1 
#         li $v0, 1
#         syscall
# 
#         li $a0, '\n'
#         li $v0, 11
#         syscall
# 
#         beq $t1, $zero, fin
# 
#         j seguir
# 
# fin:    
#         li $v0, 10
#         syscall
#

# cuestion 10
# 
# .data
# 
# error: .asciiz "te has equivocado, vuelve a poner los valores\n"
# 
# .text 
# 
# start:  li $a0, '>'
#         li $v0, 11
#         syscall
# 
#         li $v0, 5
#         syscall
# 
#         move $t0, $v0
# 
#         li $a0, '>'
#         li $v0, 11
#         syscall
#         li $v0, 5
#         syscall
# 
#         move $t1, $v0
#     
#         bgt $t1, $t0, inicio
# 
#         la $a0, error
#         li $v0, 4
#         syscall
# 
#         j start
# 
# inicio:
# 
#         move $a0, $t0
# 
#         li $v0, 1
#         syscall
# 
#         li $a0, '\n'
#         li $v0, 11
#         syscall
# 
#         addi $t0, $t0, 1
# 
#         beq $t0, $t1, fin
#         j inicio
# fin:
#         move $a0, $t1
#         li $v0, 1
#         syscall
#         li $v0, 10
#         syscall
#         
