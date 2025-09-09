# Programa en MIPS para encontrar el número menor entre 3 y 5 valores
# Autor: Maykol Alejandro Riveros Navarrete

.data
msgCantidad: .asciiz "¿Cuántos números desea ingresar (3 a 5)? "
msgNum:      .asciiz "Ingrese un número: "
msgMenor:    .asciiz "El número menor es: "

.text
.globl main

main:
    # Pedir cantidad de números
    li $v0, 4
    la $a0, msgCantidad
    syscall

    li $v0, 5
    syscall
    move $t0, $v0      # $t0 = cantidad de números

    li $t1, 0          # contador
    li $t2, 2147483647 # inicializar menor con el valor máximo posible

loop_ingreso:
    beq $t1, $t0, fin_menor

    # Pedir número
    li $v0, 4
    la $a0, msgNum
    syscall

    li $v0, 5
    syscall
    move $t3, $v0   # $t3 = número ingresado

    # Comparar con el menor actual
    bgt $t3, $t2, no_cambiar
    move $t2, $t3   # actualizar menor

no_cambiar:
    addi $t1, $t1, 1
    j loop_ingreso

fin_menor:
    # Mostrar resultado
    li $v0, 4
    la $a0, msgMenor
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
