

    






# cuestion 1
# 
# lui $t0, 0xffff # Direc. del registro de control del teclado
# li $t1, 0 #Inicia un contador de espera
# b_espera:
# lw $t2, ($t0) #Lee registro control del teclado
# #SINCRONIZACIÓN:
# andi $t2, $t2, 1 #Extrae el bit de ready
# addiu $t1, $t1, 1 #Incrementa el contador
# #(cuenta las iteraciones)
# beqz $t2, b_espera # Si cero no hay carácter
# lw $v0, 4($t0) #Lee registro de datos del teclado
# 
# move $a0, $v0
# 
# lui $t0,0xffff #ffff0000;
# b_espera2:
# lw $t1,8($t0) #registro control
# #SINCRONITZACIÓN
# andi $t1,$t1,0x0001 #bit de ready Sincroniza
# beq $t1,$0,b_espera2
# # TRANSFERENCIA
# sw $a0,12($t0) # Escribe en la consola
# 
# 
# el programa lee el valor y lo escribe en la consola
# 

# cuestion 2
# 
# .text
# main: 
#     jal getc
#     move $a0, $v0
#     jal putc
# 
#     li $v0, 10
#     syscall
# 
# 
# 
# 
# getc:
# lui $t0, 0xffff # Direc. del registro de control del teclado
# li $t1, 0 #Inicia un contador de espera
# b_espera:
#     lw $t2, ($t0) #Lee registro control del teclado
#     andi $t2, $t2, 1 #Extrae el bit de ready
#     addiu $t1, $t1, 1 #Incrementa el contador
# #(cuenta las iteraciones)
#     beqz $t2, b_espera # Si cero no hay carácter
# lw $v0, 4($t0) #Lee registro de datos del teclado
# 
# putc:
# lui $t0,0xffff #ffff0000;
# b_espera2:
#     lw $t1, 8($t0) #registro control
#             #SINCRONITZACIÓN
#     andi $t1,$t1,0x0001 #bit de ready Sincroniza
#     beq $t1,$0,b_espera2
#             # TRANSFERENCIA
#     sw $a0, 12($t0) # Escribe en la consola
# 

# cuestion 3
# 
# .text
# main: 
#     jal getc
# fingetc:
#     move $a0, $v0
#     jal putc
# finputc:
# 
#     subi $s1, $a0, '\n'
#     bne $s1, $zero, main
# 
# li $v0, 10
# syscall
# 
# 
# getc:
# lui $t0, 0xffff # Direc. del registro de control del teclado
# li $t1, 0 #Inicia un contador de espera
# b_espera:
#     lw $t2, ($t0) #Lee registro control del teclado
#     andi $t2, $t2, 1 #Extrae el bit de ready
#     addiu $t1, $t1, 1 #Incrementa el contador
# #(cuenta las iteraciones)
#     beqz $t2, b_espera # Si cero no hay carácter
# lw $v0, 4($t0) #Lee registro de datos del teclado
# j fingetc
# 
# putc:
# lui $t0,0xffff #ffff0000;
# b_espera2:
#     lw $t1, 8($t0) #registro control
#             #SINCRONITZACIÓN
#     andi $t1,$t1,0x0001 #bit de ready Sincroniza
#     beq $t1,$0,b_espera2
#             # TRANSFERENCIA
#     sw $a0, 12($t0) # Escribe en la consola
#     j finputc
# 

# cuestion 4
# 
# .text
# main: 
#     jal getc
# fingetc:
#     subi $a0, $v0, 32
#     jal putc
# finputc:
# 
#     # el salto de línea es el numero 10, por lo que si 
#     # a todos los caracteres se le restan 32 para poneros
#     # en mayúsculas, basta con restarle 10 -32 para
#     # obtener el nuevo identificador del salto de línea
#     subi $s1, $a0, -22
#     bne $s1, $zero, main
# 
# li $v0, 10
# syscall
# 
# 
# getc:
# lui $t0, 0xffff # Direc. del registro de control del teclado
# b_espera:
#     lw $t2, ($t0) #Lee registro control del teclado
#     andi $t2, $t2, 1 #Extrae el bit de ready
#     beqz $t2, b_espera # Si cero no hay carácter
# lw $v0, 4($t0) #Lee registro de datos del teclado
# j fingetc
# 
# putc:
# lui $t0,0xffff #ffff0000;
# b_espera2:
#     lw $t1, 8($t0) #registro control
#             #SINCRONITZACIÓN
#     andi $t1,$t1,0x0001 #bit de ready Sincroniza
#     beq $t1,$0,b_espera2
#             # TRANSFERENCIA
#     sw $a0, 12($t0) # Escribe en la consola
#     j finputc
# 


# cuestion 5
# 
# .data
#     cadena: .space 32
#     .eqv ControlTeclado 0
#     .eqv BufferTeclado 4
#     .eqv ControlDisplay 8
#     .eqv BufferDisplay 12
# .text
# 
# la $a0,cadena
# jal read_string
# fin:
# la $a0,cadena
# jal print_string
# 
# li $v0,10
# syscall
# #############################
# print_string:
#     la $t0,0xFFFF0000
# sync: lw $t1, ControlDisplay($t0)
#     andi $t1,$t1,1
#     beqz $t1,sync
#     lbu $t1,0($a0)
#     beqz $t1,final
#     sw $t1, BufferDisplay($t0)
#     addi $a0,$a0,1
#     j sync
# final:
#     jr $ra
# 
# read_string:
#     lui $t1, 0xffff
#     lb $t2, ControlTeclado($t1)
#     andi $t2, $t2, 1
#     beqz $t2, read_string
# 
#     lb $t2, BufferTeclado($t1)
#     sb $t2, 0($a0)
#     addi $a0, $a0, 1
#     subi $t2, $t2, '\n'
#     beqz $t2, fin
#     j read_string
# 
