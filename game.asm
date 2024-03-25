.data 
mapa: .space 4096

posicion: .word 0x10010000 # guarda la posicion de plman 
posicionEnemigo: .word 0x10010ffc # guarda la posicion de plman 
posicionZonaSegura: .word 0x10010ffc # guarda la posicion de plman 

.eqv fondo 		0x000000
.eqv personaje 	0xffff00
.eqv enemigo 	0xff0000

#
# matrz de 32 por 32
# cada elemento es una palabra en memoria 
# se reservan 4096 posiciones de memoria
#
#
#

.text

# direcciones de memoria 
lw $s1, posicion
lw $s2, posicionEnemigo


bucle:

	j pintarPersonaje
sigue:

	jal pintarEnemigo

	addi $s2, $s2, 4
	beq $s1, $s2, fin
	subi $s2, $s2, 4

	j bucle

fin:
li $v0, 10
syscall
####################################

pintarPersonaje:
li $v0, 12
syscall

li $t0, 'd'
beq $t0, $v0, irDerecha
vueltaD:

li $t0, 'a'
beq $t0, $v0, irIzquierda
vueltaI:

li $t0, 's'
beq $t0, $v0, irAbajo
vueltaAb:


li $t0, 'w'
beq $t0, $v0, irArriba
vueltaAr:

j sigue

## Estas funciones varían la posicion del personaje
irDerecha:
li $t0, personaje
sw $t0, 4($s1)
li $t0, fondo
sw $t0, ($s1)
addi $s1, $s1, 4

j vueltaD

irIzquierda:
li $t0, personaje
sw $t0, -4($s1)
li $t0, fondo
sw $t0, ($s1)
subi $s1, $s1, 4
j vueltaI

irArriba:
li $t0, personaje
sw $t0, -128($s1)
li $t0, fondo
sw $t0, ($s1)
subi $s1, $s1, 128
j vueltaAr

irAbajo:
li $t0, personaje
sw $t0, 128($s1)
li $t0, fondo
sw $t0, ($s1)
addi $s1, $s1, 128
j vueltaAb

pintarEnemigo:


li $t0, enemigo
sw $t0, 0($s2)
li $t0, fondo

sw $t0, 4($s2)
subi $s2, $s2, 4
jr $ra





