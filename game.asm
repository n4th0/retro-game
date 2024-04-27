
# DOCUMENTACIÓN
# 
# matrz de 32 por 32
# cada elemento es una palabra en memoria 
# se reservan 4096 posiciones de memoria 
# 
# 
# bucle
# se pregunta (se obtiene)
# se pone todas las entidades a negro
# aritmetica
# colisiones
# se pintan
# vuelta al bucle
# 
# 
# 
# 
# 
# 
# 

.data 

mapa: .space 4096  # reservar las posiciones permitidas del tablero  de juego
pared: .word # array de punteros de paredes
	0x10010000, 0x10010004, 0x10010008, 0x1001000C, 0x10010010, 0x10010014, 0x10010018, 0x1001001C, 0x10010020, 0x10010024, 0x10010028, 0x1001002C, 0x10010030, 0x10010034, 0x10010038, 
	0x1001003C, 0x10010040, 0x10010044, 0x10010048, 0x1001004C, 0x10010050, 0x10010054, 0x10010058, 0x1001005C, 0x10010060, 0x10010064, 0x10010068, 0x1001006C, 0x10010070, 0x10010074, 
	0x10010078, 0x1001007C, 0x10010080, 0x100100A4, 0x100100AC, 0x100100B0, 0x100100B4, 0x100100E8, 0x100100F4, 0x100100F8, 0x100100FC, 0x10010100, 0x10010108, 0x10010110, 0x10010114, 
	0x10010130, 0x1001013C, 0x10010140, 0x10010150, 0x10010154, 0x10010158, 0x1001015C, 0x10010170, 0x10010174, 0x10010178, 0x1001017C, 0x10010180, 0x10010188, 0x10010190, 0x10010194, 
	0x10010198, 0x1001019C, 0x100101A8, 0x100101B4, 0x100101C0, 0x100101C8, 0x100101D4, 0x100101E8, 0x100101EC, 0x100101F0, 0x100101F8, 0x100101FC, 0x10010200, 0x10010208, 0x10010210, 
	0x10010214, 0x10010218, 0x10010224, 0x1001022C, 0x10010234, 0x10010244, 0x1001024C, 0x10010268, 0x1001026C, 0x10010274, 0x1001027C, 0x10010280, 0x10010290, 0x100102A8, 0x100102AC, 
	0x100102C0, 0x100102C4, 0x100102C8, 0x100102D0, 0x100102E0, 0x100102F0, 0x100102F4, 0x100102F8, 0x100102FC, 0x10010300, 0x10010308, 0x10010310, 0x10010314, 0x10010318, 0x1001031C, 
	0x10010324, 0x10010328, 0x1001032C, 0x10010330, 0x10010334, 0x1001033C, 0x10010344, 0x10010348, 0x10010350, 0x10010358, 0x1001035C, 0x1001036C, 0x10010374, 0x10010378, 0x1001037C, 
	0x10010380, 0x10010384, 0x10010394, 0x1001039C, 0x100103A8, 0x100103B0, 0x100103BC, 0x100103C0, 0x100103C4, 0x100103C8, 0x100103F4, 0x100103FC, 0x10010400, 0x10010404, 0x1001041C, 
	0x10010428, 0x1001042C, 0x10010430, 0x10010434, 0x1001043C, 0x10010448, 0x10010450, 0x10010458, 0x1001045C, 0x10010464, 0x1001046C, 0x10010470, 0x10010474, 0x10010478, 0x1001047C, 
	0x10010480, 0x10010484, 0x10010490, 0x10010494, 0x1001049C, 0x100104AC, 0x100104B0, 0x100104B4, 0x100104F8, 0x100104FC, 0x10010500, 0x10010504, 0x10010508, 0x10010514, 0x1001051C, 
	0x10010528, 0x10010530, 0x10010540, 0x10010544, 0x10010554, 0x1001056C, 0x10010570, 0x10010578, 0x1001057C, 0x10010580, 0x1001058C, 0x10010598, 0x1001059C, 0x100105B4, 0x100105C0, 
	0x100105C4, 0x100105CC, 0x100105D8, 0x100105F8, 0x100105FC, 0x10010600, 0x10010618, 0x10010664, 0x10010668, 0x10010678, 0x1001067C, 0x10010680, 0x10010684, 0x10010688, 0x1001068C, 
	0x10010694, 0x100106A0, 0x100106A4, 0x100106A8, 0x100106AC, 0x100106B4, 0x100106B8, 0x100106BC, 0x100106C8, 0x100106F0, 0x100106F8, 0x100106FC, 0x10010700, 0x10010708, 0x10010710, 
	0x10010720, 0x10010724, 0x10010734, 0x1001073C, 0x10010740, 0x10010748, 0x1001074C, 0x10010750, 0x10010754, 0x10010758, 0x10010760, 0x10010764, 0x1001076C, 0x10010770, 0x1001077C, 
	0x10010780, 0x10010784, 0x100107D0, 0x100107D8, 0x100107F8, 0x100107FC, 0x10010800, 0x10010804, 0x1001080C, 0x10010820, 0x10010834, 0x10010838, 0x1001083C, 0x10010850, 0x1001085C, 
	0x10010860, 0x10010864, 0x10010870, 0x1001087C, 0x10010880, 0x10010888, 0x10010890, 0x10010898, 0x1001089C, 0x100108A0, 0x100108A8, 0x100108AC, 0x100108B8, 0x100108D8, 0x100108E8, 
	0x100108FC, 0x10010900, 0x10010910, 0x1001091C, 0x10010920, 0x10010924, 0x10010940, 0x10010950, 0x10010960, 0x10010964, 0x1001096C, 0x10010970, 0x10010978, 0x1001097C, 0x10010980, 
	0x10010984, 0x10010988, 0x10010998, 0x100109A4, 0x100109B4, 0x100109B8, 0x100109CC, 0x100109DC, 0x100109F8, 0x100109FC, 0x10010A00, 0x10010A04, 0x10010A08, 0x10010A0C, 0x10010A1C, 
	0x10010A34, 0x10010A38, 0x10010A40, 0x10010A44, 0x10010A78, 0x10010A7C, 0x10010A80, 0x10010A88, 0x10010A90, 0x10010A98, 0x10010AA8, 0x10010AAC, 0x10010AB8, 0x10010ABC, 0x10010AC0, 
	0x10010AC4, 0x10010AC8, 0x10010AD4, 0x10010AD8, 0x10010ADC, 0x10010AE0, 0x10010AEC, 0x10010AF0, 0x10010AF8, 0x10010AFC, 0x10010B00, 0x10010B28, 0x10010B2C, 0x10010B3C, 0x10010B48, 
	0x10010B4C, 0x10010B50, 0x10010B54, 0x10010B58, 0x10010B60, 0x10010B68, 0x10010B6C, 0x10010B7C, 0x10010B80, 0x10010B8C, 0x10010B98, 0x10010BD8, 0x10010BE4, 0x10010BEC, 0x10010BF4, 
	0x10010BF8, 0x10010BFC, 0x10010C00, 0x10010C08, 0x10010C0C, 0x10010C20, 0x10010C34, 0x10010C3C, 0x10010C40, 0x10010C48, 0x10010C4C, 0x10010C54, 0x10010C58, 0x10010C7C, 0x10010C80, 
	0x10010CA0, 0x10010CB0, 0x10010CB4, 0x10010CB8, 0x10010CBC, 0x10010CC0, 0x10010CC8, 0x10010CCC, 0x10010CD0, 0x10010CD8, 0x10010CDC, 0x10010CE4, 0x10010CE8, 0x10010CEC, 0x10010CF4, 
	0x10010CFC, 0x10010D00, 0x10010D0C, 0x10010D10, 0x10010D18, 0x10010D2C, 0x10010D38, 0x10010D3C, 0x10010D40, 0x10010D64, 0x10010D70, 0x10010D74, 0x10010D7C, 0x10010D80, 0x10010D88, 
	0x10010D8C, 0x10010DA0, 0x10010DB0, 0x10010DB4, 0x10010DB8, 0x10010DD0, 0x10010DD4, 0x10010DD8, 0x10010DDC, 0x10010DE0, 0x10010DE8, 0x10010DEC, 0x10010DF0, 0x10010DF4, 0x10010DFC, 
	0x10010E00, 0x10010E08, 0x10010E0C, 0x10010E28, 0x10010E2C, 0x10010E3C, 0x10010E40, 0x10010E5C, 0x10010E6C, 0x10010E70, 0x10010E7C, 0x10010E80, 0x10010E88, 0x10010E9C, 0x10010EA0, 
	0x10010EA8, 0x10010EAC, 0x10010EB4, 0x10010EB8, 0x10010EBC, 0x10010ED4, 0x10010ED8, 0x10010EDC, 0x10010EE4, 0x10010EE8, 0x10010EF0, 0x10010EF8, 0x10010EFC, 0x10010F00, 0x10010F14, 
	0x10010F1C, 0x10010F48, 0x10010F50, 0x10010F60, 0x10010F68, 0x10010F7C, 0x10010F80, 0x10010F84, 0x10010F88, 0x10010F8C, 0x10010F90, 0x10010F94, 0x10010F98, 0x10010F9C, 0x10010FA0, 
	0x10010FA4, 0x10010FA8, 0x10010FAC, 0x10010FB0, 0x10010FB4, 0x10010FB8, 0x10010FBC, 0x10010FC0, 0x10010FC4, 0x10010FC8, 0x10010FCC, 0x10010FD0, 0x10010FD4, 0x10010FD8, 0x10010FDC, 
	0x10010FE0, 0x10010FE4, 0x10010FE8, 0x10010FEC, 0x10010FF0, 0x10010FF4, 0x10010FF8, 0x10010FFC 

posicion: .word 0x10010084  			# guarda la posicion de plman 
posicionEnemigo: .word   0x100103D4, 0x100104BC, 0x100104F4, 0x100106CC, 
	0x10010714, 0x10010A24, 0x10010A50, 0x10010C5C

posicionZonaSegura: .word 0x10010f78 	# guarda la posicion de la zona segura 

# mensajes de victoria/derrota
mensajeVictoria: .asciiz "\n\n\nEnhorabuena !!! \nHas ganado !!!!!\n"
mensajeDerrota:  .asciiz "\n\n\nLástima, inténtalo otra vez..."

.eqv fondo 		0x000000
.eqv personajeC 0xffff00
.eqv enemigoC 	0xff0000
.eqv paredesC 	0xffffff
.eqv zonaSegC 	0x00ff00
.eqv numParedes	458

.text

# direcciones de memoria 
lw $s1, posicion
la $s2, posicionEnemigo # habrá que actualizar esto para obtener las posiciones correspondientes TODO 
lw $s3, posicionZonaSegura
li $s4, 0 # contador especial para los enemigos
li $s5, 12 # cantidad de estados que tienen los enemigos (y por ende cantidad de movimientos que tienen)

# bucle para poner las paredes
li $t0, 0
li $t1, numParedes
li $t2, paredesC
la $t3, pared
impParedes:

	lw $t4, 0($t3)
	sw $t2, 0($t4)

	addi $t3, $t3, 4

	addi $t0, $t0, 1
	bne $t0, $t1, impParedes

# se pone la zona a la que hay que llegar
li $t0, zonaSegC
sw $t0, 0($s3)


#############################
## Inicio del bucle principal
#############################
bucle:

	# TODO debería pedirlo por consola??? 
	li $v0, 12
	syscall

	move $a0, $v0

	# se ponen negro las entidades
	li $t0, fondo
	sw $t0, 0($s1) 
	j pintarEnemigos
siguePE:

	la $s2, posicionEnemigo # se actualiza el valor de $s2 en cada iteración ya que cambia en la funcion
	j actualizarEnemigos
vueltaE:

	# actualiza la posicion del personaje
	j manejoInput
sigueMI:


	li $t0, personajeC # se pinta el personaje
	sw $t0, 0($s1)

	li $t1, enemigoC
	j pintarEnemigos2
siguePE2:

	addi $s4, $s4, 1 # incrementa los estados 

	bne $s4, $s5, bucle 

	li $s4, 0 # se resetea el contador de estados 

	j bucle


####################################
# funciones que terminan el programa
####################################
finV:
la $a0, mensajeVictoria
li $v0, 4
syscall
li $v0, 10
syscall

finD:
la $a0, mensajeDerrota
li $v0, 4
syscall

li $v0, 10
syscall

####################################
# parámetros: $a0 => letra introducida por el usuario
manejoInput:
li $t0, 'd'
beq $t0, $a0, irDerecha
vueltaD:

li $t0, 'a'
beq $t0, $a0, irIzquierda
vueltaI:

li $t0, 's'
beq $t0, $a0, irAbajo
vueltaAb:


li $t0, 'w'
beq $t0, $a0, irArriba
vueltaAr:

j sigueMI

###################################################
## Estas funciones varían la posicion del personaje
###################################################
# prarámetros: $s1 => posición del jugador 
#############
irDerecha:
# se comprueba si se va a chocar con una pared
lw $t0, 4($s1)
subi $t1, $t0, 0xffffff
beqz $t1, sigueMI # si se ha chocado se vuelve al bucle

subi $t1, $t0, zonaSegC # por si colisiona con la zona segura
beqz $t1, finV

subi $t1, $t0, enemigoC # por si colisiona con algún enemigo
beqz $t1, finD

addi $s1, $s1, 4 # si no se actualiza la posicion
j vueltaD

#############
irIzquierda:
# se comprueba si se va a chocar con una pared
lw $t0, -4($s1)

subi $t1, $t0, 0xffffff
beqz $t1, sigueMI # si se ha chocado se vuelve al bucle

subi $t1, $t0, zonaSegC # por si colisiona con la zona segura
beqz $t1, finV

subi $t1, $t0, enemigoC # por si colisiona con algún enemigo
beqz $t1, finD

subi $s1, $s1, 4# si no se actualiza la posicion
j vueltaI

#############
irArriba:
# se comprueba si se va a chocar con una pared
lw $t0, -128($s1)

subi $t1, $t0, 0xffffff
beqz $t1, sigueMI # si se ha chocado se vuelve al bucle

subi $t1, $t0, zonaSegC # por si colisiona con la zona segura
beqz $t1, finV

subi $t1, $t0, enemigoC # por si colisiona con algún enemigo
beqz $t1, finD

subi $s1, $s1, 128 # si no se actualiza la posicion
j vueltaAr

#############
irAbajo:
# se comprueba si se va a chocar con una pared
lw $t0, 128($s1)

subi $t1, $t0, 0xffffff
beqz $t1, sigueMI # si se ha chocado se vuelve al bucle

subi $t1, $t0, enemigoC # por si colisiona con algún enemigo
beqz $t1, finV

subi $t1, $t0, zonaSegC # por si colisiona con la zona segura
beqz $t1, finD

addi $s1, $s1, 128 # si no se actualiza la posicion
j vueltaAb


########################################
## Funciones que actualizan los enemigos
########################################

pintarEnemigos:
li $t1, fondo
move $t2, $s2
li $t3, 0 # contador 
li $t4, 8

bucleEnemigos: 

lw $t0, 0($t2)
sw $t1, 0($t0)

addi $t2, $t2, 4
addi $t3, $t3, 1
bne $t3, $t4, bucleEnemigos

j siguePE

#################
pintarEnemigos2:
li $t1, fondo
move $t2, $s2
li $t3, 0 # contador 
li $t4, 8

bucleEnemigos2: 
li $t1, enemigoC
lw $t0, 0($t2)
sw $t1, 0($t0)

addi $t2, $t2, 4
addi $t3, $t3, 1
bne $t3, $t4, bucleEnemigos2

j siguePE2
################ (equivalente a un else-if)
actualizarEnemigos:

subi $t1, $s4, 0
bne $t1, $zero, cont1
# actualizar los enemigos con el lw y el sw

# lw $t2, 0($s2)
# sw $t1, 0($t2)

j vueltaE

cont1:
subi $t1, $s4, 1
bne $t1, $zero, cont2


lw $t2, 0($s2)
addi $t2, $t2, 4
sw $t2, 0($s2)


# actualizar los enemigos con el lw y el sw
j vueltaE
cont2:
subi $t1, $s4, 2
bne $t1, $zero, cont3

# actualizar los enemigos con el lw y el sw
j vueltaE
cont3:
subi $t1, $s4, 3
bne $t1, $zero, cont4

# actualizar los enemigos con el lw y el sw
j vueltaE
cont4:
subi $t1, $s4, 4
bne $t1, $zero, cont5

# actualizar los enemigos con el lw y el sw
j vueltaE
cont5:
subi $t1, $s4, 5
bne $t1, $zero, cont6

# actualizar los enemigos con el lw y el sw
j vueltaE
cont6:
subi $t1, $s4, 6
bne $t1, $zero, cont7

# actualizar los enemigos con el lw y el sw
j vueltaE
cont7:
subi $t1, $s4, 7
bne $t1, $zero, cont8

# actualizar los enemigos con el lw y el sw
j vueltaE
cont8:
subi $t1, $s4, 8
bne $t1, $zero, cont9

# actualizar los enemigos con el lw y el sw
j vueltaE
cont9:
subi $t1, $s4, 9
bne $t1, $zero, cont10

# actualizar los enemigos con el lw y el sw
j vueltaE
cont10:
subi $t1, $s4, 10
bne $t1, $zero, cont11

# actualizar los enemigos con el lw y el sw

j vueltaE
cont11:
subi $t1, $s4, 11
bne $t1, $zero, cont12

cont12: # si llega aqui, es que no es ninguno de los anteriores
# actualizar los enemigos con el lw y el sw

j vueltaE




