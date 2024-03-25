
# cuestión 1
# 
# vaddr => 0x00000000
# status =>0x0000ff11
# case => 0x00000000
# epc => 0x00000000
# 
# vaddr => 0x00000000
# status =>0x0000ff13
# case => 0x00000030
# epc => 0x0040000c
# 

# cuestión 2
# 
# vaddr => 0x00000000 
# al no haber ninguna excepción se queda en 0 la dirección en la que habría ocurrido la excepción (en caso de que dicha excepción sea de tipo referencia inválida a una dirección
# de memoria)
# status =>0x0000ff11 
# tiene el habilitador activado (ultimo bit) el nivel de excepción no está activado (sería un 3 en vez de un 1 en los ultimos 4 bits)
# el nivel de excepción en modo usuario sabemos que está fijado a 1 en Mars. la mascara está completamente activa (todos unos) ya que están habilitadas todas las
# excepciones ( 6 de hardware y 2 de software )
# case => 0x00000000
# está todo ha cero ya que no hay excepciones pendientes ni hay código de excepción (aún no ha ocurrido ninguna)
# epc => 0x00000000
# al no haberse ejecutado la excepción no se guarda ninguna dirección 
# 
# 
# 
# vaddr => 0x00000000
# al no ser una excepción de tipo referencia inválida a una dirección de memoria, se queda todo a 0
# status =>0x0000ff13
# se quedan todas las excepciones habilitadas pero el nivel de excepción está activado ya que ha ocurrido una excepción
# case => 0x00000030
# aqui se indicaría el tipo de excepción que en este caso el codigo que da es de 01100 que en decimal es 12, si se mira la tabla nos damos cuenta de que es por desbordamiento
# epc => 0x0040000c
# aqui se guarda la dirección de memoria en la cual ha ocurrido la excepción (0x0040000c) la tercera instrucción 

# cuestión 3
# 
# vaddr => 0x00000000
# status =>0x0000ff11
# case => 0x00000000
# epc => 0x00000000
# 
# vaddr => 0x0000007c
# status =>0x0000ff13
# case => 0x00000014
# epc => 0x00400004
# 

# cuestión 4
# esto es igual que la cuestión 1, ya que el estado inicial de los registros del coproc 0 se mantiene constante mientras no haya excepciones
# vaddr => 0x00000000 
# al no haber ninguna excepción se queda en 0 la dirección en la que habría ocurrido la excepción (en caso de que dicha excepción sea de tipo referencia inválida a una dirección
# de memoria)
# status =>0x0000ff11 
# tiene el habilitador activado (ultimo bit) el nivel de excepción no está activado (sería un 3 en vez de un 1 en los ultimos 4 bits)
# el nivel de excepción en modo usuario sabemos que está fijado a 1 en Mars. la mascara está completamente activa (todos unos) ya que están habilitadas todas las
# excepciones ( 6 de hardware y 2 de software )
# case => 0x00000000
# está todo ha cero ya que no hay excepciones pendientes ni hay código de excepción (aún no ha ocurrido ninguna)
# epc => 0x00000000
# al no haberse ejecutado la excepción no se guarda ninguna dirección 
# 
# 
# 
# vaddr => 0x0000007c
# en este campo se almacenaa la dirección de la memoria a la que no se ha podido acceder (está reservada en este caso, por lo que es inaccesible) 
# status =>0x0000ff13
# se quedan todas las excepciones habilitadas pero el nivel de excepción está activado ya que ha ocurrido una excepción
# case => 0x00000014
# aqui se indica el tipo de excepción que se ha producido si se convierte el campo de la excepción sería 00101 (excepción por dirección erronea (store))
# epc => 0x00400004
# la dirección de memoria de la excepción
# 

# cuestión 5
# 
# igual que las cuestiones immpares anteriores (quitando los ultimos valores)
# 
# vaddr => 0x00000000
# status =>0x0000ff11
# case => 0x00000000
# epc => 0x00000000
# 
# vaddr => 0x10010003
# status =>0x0000ff13
# case => 0x00000010
# epc => 0x00400000
# 

# cuestión 6
# esto es igual que la cuestión 1, ya que el estado inicial de los registros del coproc 0 se mantiene constante mientras no haya excepciones
# vaddr => 0x00000000 
# al no haber ninguna excepción se queda en 0 la dirección en la que habría ocurrido la excepción (en caso de que dicha excepción sea de tipo referencia inválida a una dirección
# de memoria)
# status =>0x0000ff11 
# tiene el habilitador activado (ultimo bit) el nivel de excepción no está activado (sería un 3 en vez de un 1 en los ultimos 4 bits)
# el nivel de excepción en modo usuario sabemos que está fijado a 1 en Mars. la mascara está completamente activa (todos unos) ya que están habilitadas todas las
# excepciones ( 6 de hardware y 2 de software )
# case => 0x00000000
# está todo ha cero ya que no hay excepciones pendientes ni hay código de excepción (aún no ha ocurrido ninguna)
# epc => 0x00000000
# al no haberse ejecutado la excepción no se guarda ninguna dirección 
# 
# 
# 
# vaddr => 0x10010003
# almacena la dirección de memoria a la que se ha intentado acceder (ha saltado una excepción al hacerlo)
# status =>0x0000ff13
# se quedan todas las excepciones habilitadas pero el nivel de excepción está activado ya que ha ocurrido una excepción
# case => 0x00000010
# 
# se queda registrado el tipo de excepción que se ha producido 000100 (excepción por dirección errónea (load word))
# epc => 0x00400000
# la linea en la que se ha producido la excepción
# 

# cuestion 7
# 0x00000000 campo 00000 => sin excepción
# 0x00000020 campo 01000 => excepción syscall
# 0x00000024 campo 01001 => excepción por break point
# 0x00000028 campo 01010 => excepción por instrucción reservada
# 0x00000030 campo 01100 => excepción por desbordamiento aritmético
# 
# 

# cuestion 8
# 
# addi $12, $12, 0xD
# jr $k0
# 
# 
# nos interesa modificar la útlima parte de los 32 bits del registro status
# por lo que hacemos una and con la letra D (1101 en binario), haciendo que 
# se ponga ha 0 el segundo bit por la derecha del registro dando entender que 
# no se ha dado ninguna excepción
# 
# saltamos a la dirección de memoria de $k0, que era la que tenía epc sumandole 4,
# es decir, a la siguiente instrucción del programa original
# 

# cuestion 9 
# 
# el codigo final quedaría así:
# 
# .data
# mensajePrueba: .asciiz "\nvuelvo al programa principal?"
# .text
# li $t0, 0x7FFFFFFF
# addi $t2, $t0, 1 #Detecta el desbordamiento
# 
# la $a0, mensajePrueba
# li $v0, 4
# syscall
# 
# .kdata
# registros: .word 0,0,0,0 # Espacio para guardar 4 registros
# mis1:.asciiz"\nExcepción dirección errónea ocurrida en la dirección: "
# mis2:.asciiz "\nExcepción desbordamiento ocurrida en la dirección: "
# mis3:.asciiz "\nEn cualquier caso continuamos el programa...\n"
# 
# .ktext 0x80000180 # Dirección de comienzo de la rutina
# la $k1, registros
# sw $at, 0($k1) # Es importante guardar el registro $at
# sw $v0, 4($k1)
# sw $a0, 8($k1)
# 
# mfc0 $a0, $13 # $a0 <= registro Cause
# andi $a0, $a0, 0x3C # extraemos en $a0 el código de excepción
# li $s0, 0x0030 # código Desbordamiento
# li $s1, 0X0014 # código error de dirección store
# beq $a0, $s0, Desbord
# bne $a0, $s1, salida
# la $a0, mis1
# li $v0, 4
# syscall
# 
# mfc0 $a0, $14 # $a0 <= EPC, donde ha ocurrido la excepción
# 
# li $v0, 34
# syscall # Escribimos EPC en hexadecimal
# 
# Desbord:
#     la $a0, mis2
#     li $v0, 4
#     syscall
#     mfc0 $a0, $14 # $a0 <= EPC, donde ha ocurrido la excepción
#     li $v0, 34
#     syscall # Escribimos EPC en hexadecimal
# salida:
#     la $a0, mis3
#     li $v0, 4
#     syscall
# 
# la $k1, registros
# lw $at, 0($k1)
# lw $v0, 4($k1)
# lw $a0, 8($k1)
# #Iniciamos registro Vaddr del coprocesador 0
# mtc0 $zero, $8
# #Cómo se trata de excepciones se actualiza el registro EPC
# mfc0 $k0, $14 # $k0 <= EPC
# addiu $k0, $k0, 4 # Incremento de $k0 en 4
# mtc0 $k0, $14 # Ahora EPC apunta a la siguiente instrucción
# addi $12, $12, 0xD
# jr $k0
# # eret # Vuelve al programa de usuario

# cuestion 10
# 
# .kdata
# contexto: .word 0,0,0,0 # espacio para alojar cuatro registros
# .ktext 0x80000180 # Dirección de comienzo de la rutina
# # Guardar registros a utilizar en la rutina.
# la $k1, contexto
# sw $at, 0($k1) # Guardamos $at
# sw $t0, 4($k1)
# sw $v0, 8($k1)
# sw $a0, 12($k1)
# #Comprobación de si se trata de una interrupción
# mfc0 $k0, $13 # Registro Cause
# srl $a0, $k0, 2 # Extraemos campo del código
# andi $a0, $a0, 0x1f
# bne $a0, $zero, acabamos # Sólo procesamos aquí E/S
# #Tratamiento de la interrupción
# li $t0, 0xffff0000 #
# lb $a0, 4($t0) # Lee carácter del teclado
# # Por ejemplo:
# # Escribe en la consola del MARS el carácter leído
# li $v0, 11
# syscall
# # Antes de acabar se podría dejar todo iniciado:
# acabamos: mtc0 $0, $13 # Iniciar registro Cause
# mfc0 $k0, $12 # Leer registre Status
# andi $k0, 0xfffd # Iniciar bit de excepción
# ori $k0, 0x11 # Habilitar interrupciones
# mtc0 $k0, $12 # reescribir registre Startus
# # Restaurar registros
# lw $at, 0($k1) # Recupero $at
# .data
# prueba: .byte 0
# .text
# 
# lui $t0,0xffff # Dirige del registro de control
# lw $t1,0($t0) # Registre de control del receptor
# ori $t1,$t1,0x0002 # Habilitar interrupciones del teclado
# sw $t1,0($t0) 
# mfc0 $a0, $12 # leer registre Status
# ori $a0, 0xff11 # Habilitar todas las interrupciones
# mtc0 $a0, $12 
# 
# bucle: 
#     addiu $t1, $zero, 0xffff0000
#     lb $t2, 0($t1)
#     andi $t2, $t2, 1
#     beqz $t2, bucle
#     lb $t2, 4($t1)
#     sb $t2, prueba
# 
# 
# li $v0, 10
# syscall

# cuestion 11
# 
# .kdata 
# contexto: .word 0, 0, 0
# .ktext 0x80000180 # Dirección de comienzo de la rutina
# # guardado el contexto (los registros que vamos a tocar)
# la $k1, contexto
# sw $at, 0($k1)
# sw $t0, 4($k1)
# sw $a0, 8($k1)
# 
# mfc0 $t0, $13
# srl $t0, $t0, 2
# beqz $t0, acabamos
# 
# la $t0, 0xFFFF0008
# 
# sw $v0, 4($t0)
# 
# acabamos:
#     mtc0 $zero, $13 # registro case 
#     mfc0 $t0, $12  # registro de status
#     andi $t0, $t0,0xfffffffd
#     ori $t0, $t0, 0x00000011
#     mtc0 $t0, $12
#     lw $at, 0($k1)
#     lw $t0, 4($k1)
#     lw $a0, 8($k1)
# 
# eret
# 
# .data
# prueba: .byte 0
# .text
# 
# lui $t0,0xffff # Dirige del registro de control
# lw $t1,0($t0) # Registre de control del receptor
# ori $t1,$t1,0x0002 # Habilitar interrupciones del teclado
# sw $t1,0($t0) 
# 
# mfc0 $a0, $12 # leer registre Status
# ori $a0, 0xff11 # Habilitar todas las interrupciones
# mtc0 $a0, $12 
# 
# bucle1:
#     li $t1, 0xffff0000
#     lb $t2, 0($t1) 
#     andi $t2, $t2, 1
#     beqz $t2, bucle1
#     # excepción
#     lb $v0, 4($t1)
# 
#     subi $t3, $v0, '\n'
# bne $t3, $zero, bucle1
# 
# 
# 
# 
# li $v0, 10
# syscall
# 

# cuestion 12
# 
# 00101 00 => no alineada sb (puedo comprobar el registro $8)
# 00010 00=> no alineada lb
# 01100 00 => overflow
# 00000 => hardware
# 
# .kdata 
# contexto: .word 0, 0, 0, 0
# .eqv campoOverflow    0x0000000c
# .eqv campoloadb         0x00000004
# .eqv campostore         0x00000014
# .eqv coger5bits         0x0000001f
# mensajeMemoria: .asciiz "Ha habido un error en memoria\n"
# mensajeOverflow: .asciiz "Ha habido un overflow\n"
# mensajeHardware: .asciiz "Ha habido una interrupción por hardware\n"
# .ktext 0x80000180 # Dirección de comienzo de la rutina
# # guardado el contexto (los registros que vamos a tocar)
# la $k1, contexto
# sw $at, 0($k1)
# sw $t0, 4($k1)
# sw $a0, 8($k1)
# sw $v0, 12($k1)
# 
# mfc0 $t0, $13
# srl $t0, $t0, 2
# 
# 
# andi $t0, $t0, coger5bits
# 
# la $a0, mensajeHardware
# bne $zero, $t0, siguiente1
# li $v0, 4
# syscall
# j acabamos
# 
# siguiente1:
# la $a0, mensajeOverflow
# li $v0, campoOverflow
# bne $v0, $t0, siguiente2
# li $v0, 4
# syscall
# j acabamos
# 
# siguiente2:
# la $a0, mensajeMemoria
# li $v0, campoloadb
# beq $v0, $t0, imp
# li $v0, campostore
# beq $v0, $t0, imp
# j acabamos
# 
# imp:
# li $v0, 4
# syscall
# j acabamos
# 
# acabamos:
#     mtc0 $zero, $13 # registro case 
#     mfc0 $t0, $12  # registro de status
#     andi $t0, $t0,0xfffffffd
#     ori $t0, $t0, 0x00000011
#     mtc0 $t0, $12
# 
#     mfc0 $t0, $14 # le sumo 4 al pc, para que no haya un bucle infinito
#     addi $t0, $t0, 4
#     mtc0 $t0, $14
# 
#     lw $at, 0($k1)
#     lw $t0, 4($k1)
#     lw $a0, 8($k1)
#     lw $v0, 12($k1)
#     eret
# 
# 
# 
# .data
# prueba: .word 0
# .text
# 
# lui $t0,0xffff # Dirige del registro de control
# lw $t1,0($t0) # Registre de control del receptor
# ori $t1,$t1,0x0002 # Habilitar interrupciones del teclado
# sw $t1,0($t0) 
# 
# mfc0 $a0, $12 # leer registre Status
# ori $a0, 0xff11 # Habilitar todas las interrupciones
# mtc0 $a0, $12 
# 
# 
# la $t1, prueba 
# lw $t2, 3($t1)
# 
# li $t0, 0x7FFFFFFF
# addi $t2, $t0, 1 
# 
# bucle: 
# li $t0, 0xffff0000 
# lb $t1, 0($t0)
# andi $t1, $t1,1
# beqz $t1,bucle
# lb $t1, 4($t0)
# 
# li $v0, 10
# syscall
# 
