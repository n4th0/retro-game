
# cuestion 1
# 
# .data
# str:    .ascii "Estructura de los"
#         .asciiz "Computadores"
# mensaje: .asciiz "El número de caracteres de la cadena es "
# .text
# 
# la $s0, str
# add $s1, $zero, $zero
# loop:
#     add $t0, $s0, $s1
#     lb $t1, 0($t0)
#     beq $t1, $zero, mostrar
#     addi $s1, $s1, 1
# j loop
# 
# mostrar: 
#     la $a0, mensaje
#     li $v0, 4
#     syscall
#     move $a0, $s1
#     li $v0, 1
#     syscall
# 
# exit: li $v0, 10
#     syscall
# 

# cuestion 2
# 
# .data
# str:    .ascii "Estructura de los"
#         .asciiz "Computadores"
# mensaje: .asciiz "El número de caracteres de la cadena es "
# 
# .text
# la $s0, str
# add $s1, $zero, $zero
# li $t2, 'u'
# 
# loop:
#     add $t0, $s0, $s1
#     lb $t1, 0($t0)
#     beq $t1, $zero, mostrar
#     beq $t1, $t2, sumar
#     addi $s1, $s1, 1
# j loop
# 
# sumar: 
#     addi $t3, $t3, 1
#     addi $s1, $s1, 1
#     j loop
# 
# mostrar: 
#     la $a0, mensaje
#     li $v0, 4
#     syscall
#     move $a0, $t3
#     li $v0, 1
#     syscall
#     j exit
# 
# 
# exit: li $v0, 10
#     syscall
# 

# cuestion 3
# 
# .data
# A: .word 2, 4, 6, 8, 10 # vector A iniciado con valores
# B: .word 0:4 # Vector B vacío
# 
# .text
# la $s0, A 
# la $s1, B 
# li $s5, 5 
# li $s2, 0
# 
# loop:
#     slt $t5, $s2, $s5
#     beqz $t5, fin
#     add $t1, $s0, $t0
#     add $t2, $s1, $t0
# 
#     lw $t3, 0($t1)
#     sw $t3, 0($t2)
# 
#     addi $s2, $s2, 1 
#     sll $t0, $s2, 2  
#     j loop
# fin:
# li $v0, 10 #Acaba el programa
# syscall
# 


# cuestion 4
# 
# .data
# B: .word 0:4
# mensaje: .asciiz "dime los numeros que quieres guardar: "
# 
# .text
# la $s1, B
# li $s5, 5
# 
# loop:
#     add $t2, $s1, $t0
#     addi $s2, $s2, 1
# 
#     la $a0, mensaje
#     li $v0, 4
#     syscall
# 
#     li $v0, 5
#     syscall
# 
#     sw $v0, 0($t2)
# 
#     sll $t0, $s2, 2
#     bne $s2, $s5, loop
# 
# li $v0, 10
# syscall
# 

# cuestion 5
# 
# .data
# A: .word 2, 4, 6, 8, 10 # vector A iniciado con valores
# B: .word 2, 4, 6, 8, 10 # Vector B vacío (lo inicializo para comprobar el resultado)
# C: .space 50 # Otra definición de vector vacio
# 
# .text
# la $s0, A # Dirección base del vector A
# la $s1, B # Dirección base del vector B
# la $s3, C
# li $s5, 5 # Tamaño del vector
# 
# loop:
#     add $t1, $s0, $t0
#     add $t2, $s1, $t0
#     add $t5, $s3, $t0
#     addi $s2, $s2, 1 # Índice del vector
# 
#     lw $t3, 0($t1)
#     lw $t4, 0($t2)
# 
#     add $t6, $t3, $t4
# 
#     sw $t6, 0($t5)
# 
#     sll $t0, $s2, 2 # Índice del vector x4
#     bne $s2, $s5, loop
# li $v0, 10 #Acaba el programa
# syscall

# cuestion 6
# 
# .data
# matriz: .word   1, 4, 7, 
#                 2, 5, 8, 
#                 3, 6, 9
# columnas: .word 3 # Número de columnas
# 
# .text
# la $t0, matriz
# lw $t3, columnas
# li $t2, 0 #iniciamos índice para recorrer matriz
# 
# 
# bucle:
#     lw $t1, 0($t0) #Fila 0
#     move $a0, $t1
#     jal imprimir
# 
#     lw $t1, 12($t0) #Fila 1 (1*3elementos)
#     move $a0, $t1
#     jal imprimir
# 
#     lw $t1, 24($t0) #Fila 2 (2*3elementos)
#     move $a0, $t1
# 
#     jal imprimir
#     jal nuevalin
# 
#     addi $t2, $t2, 1 # incremento índice
#     addi $t0, $t0, 4 #nueva columna
# 
#     bne $t2, $t3, bucle
# 
# li, $v0, 10 #Acaba el programa
# syscall
# 
# imprimir: #Función imprimir
#     li, $v0, 1
#     syscall
#     li $a0, '\t'
#     li $v0, 11
#     syscall
#     jr $ra #Retorno de la función
# nuevalin: #Función nueva línea
#     li $a0,'\n'
#     li, $v0, 11
#     syscall
# jr $ra #Retorno de la función

# cuestion 7
# 
# .data
# vector: .word -4, 5, 8, -1
# msg1: .asciiz "\n La suma de los valores positivos és = "
# msg2: .asciiz "\n La suma de los valores negativos és = "
# 
# .text
# Principal:
#     li $v0, 4 # Función para imprimir string
#     la $a0, msg1 # Leer la dirección de msg1
#     syscall
#     la $a0, vector # dirección del vector como parámetro
#     li $t5, 4 # Longitud del vector como parámetro
#     li $t0, 0
#     li $v0, 0
#     li $v1, 0
#     jal sum # Llamada a la función sum
# # esta etiqueta es necesaria ya que aun no conozco la forma de acceder a otras partes del $ra (preguntar en clase)
# fin:
#     move $a0, $v0 # Resultado 1 de la función
#     li $v0, 1
#     syscall # Imprimir suma positivos
#     li $v0, 4
#     la $a0, msg2
#     syscall
#     li $v0, 1
#     move $a0, $v1 # Resultado 2 de la función
#     syscall # imprimir suma negativos
#     li $v0, 10 # Acabar programa
#     syscall
# ####################################
# # Funciones #
# ####################################
# 
# sum: 
#     lw $a1, 0($a0)
# 
#     bgtz $a1, suma
#     jal sumanegativos
#     
#     addi $a0, $a0, 4
#     addi $t0, $t0, 1
#     bne $t0, $t5, sum
#     j fin
#     
# suma:
#     add $v0, $v0, $a1
#     jr $ra
# 
# sumanegativos:
#     add $v1, $a1, $v1
#     jr $ra

# cuestion 8
# 
# .data 
# matriz: .word 0,0,0,0,
#             0,0,0,0,
#             0,0,0,0,
#             0,0,0,0
# str: .asciiz "dime un número> "
# str1: .asciiz "el resultado es> "
# .text
# la $s0, matriz
# li $t1, 16
# li $t0, 0
# jal bucle_pregunta
# la $a0, matriz
# 
# li $a1, 4
# li $t2, 0
# li $t0, 0
# jal bucle_suma
# 
# la $a0, str1
# li $v0, 4
# syscall
# move $a0, $t2
# li $v0, 1
# syscall
# # fin
# li $v0, 10 
# syscall
# 
# 
# 
# bucle_pregunta:
# 
#     la $a0, str
#     li $v0, 4
#     syscall
# 
#     li $v0, 5
#     syscall
#     sw $v0, 0($s0)
#     addi $s0, $s0, 4
#     addi $t0, $t0, 1
#     bne $t0, $t1, bucle_pregunta
#     jr $ra
# 
# bucle_suma:
#     lw $t1, 0($a0)
# 
#     add $t2, $t2, $t1
# 
#     addi $a0, $a0, 20
#     addi $t0, $t0, 1
#     bne $t0, $a1, bucle_suma
#     jr $ra









