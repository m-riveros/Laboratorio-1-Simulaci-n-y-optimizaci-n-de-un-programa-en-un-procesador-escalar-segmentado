# Programa en MIPS para encontrar el número mayor entre 3 y 5 valores
# Autor: Maykol Alejandro Riveros Navarrete

.data
msgCantidad: .asciiz "¿Cuántos números desea ingresar (3 a 5)?"
msgNum:      .asciiz "Ingrese un número: "
msgMayor:    .asciiz "El número mayor es: "

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
    li $t2, -2147483648  # inicializar mayor con el valor mínimo posible

loop_ingreso:
    beq $t1, $t0, fin_mayor

    # Pedir número
    li $v0, 4
    la $a0, msgNum
    syscall

    li $v0, 5
    syscall
    move $t3, $v0   # $t3 = número ingresado

    # Comparar con el mayor actual
    blt $t3, $t2, no_cambiar
    move $t2, $t3   # actualizar mayor

no_cambiar:
    addi $t1, $t1, 1
    j loop_ingreso

fin_mayor:
    # Mostrar resultado
    li $v0, 4
    la $a0, msgMayor
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
