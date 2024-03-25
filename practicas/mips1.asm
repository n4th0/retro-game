 .data
   # numero: .asciiz "Hello world"
 .text
   main:

addi $t0, $zero, 0x7FFFFFFF
addi $t0, $t0, -25



#
# pc --> puntero que apunta al proceso contador de programa
#
#  importantes
#  cuestion 2, 4, 6
#
# add --> suma 
# addi --> suma inmediata
# cuestion 1 7fffff--f
# cuestion 1 800000--0
#
# 0010 00 01 000 01010 0000 0000 0000 0101
# 0x210b0005
#
# Error in /$PATH/mips1.asm line 5: Runtime exception at 0x00400000: arithmetic overflow
#
#
# codificarlo
# addi $8, $8, -1
# 0010 00 01000 01000 1111 1111 1111 1111
#
# comprobación
#  addi $8, $0, 5
#  addi $8, $8, -1
#
# con el convenio:
# addi $t1, $t0, 25
# addi $t2, $t0, 5
#
# ejercicio 6 (hacer cap de los registros)
# addi $t4, $zero, 5
# addi $t2, $zero, 8
# addi $t5, $t4, 10
# addi $t2, $t2, -4
# addi $t6, $t5, -30
# addi $t7, $t2, 0
#
# 
# 
# addi $12, $0, 5
# addi $10, $0, 8
# addi $13, $12, 10
# addi $10, $10, -4
# addi $14, $13, -30
# addi $15, $10, 0
# 
