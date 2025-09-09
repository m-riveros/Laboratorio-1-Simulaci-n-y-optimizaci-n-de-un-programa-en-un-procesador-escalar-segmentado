# Programa en MIPS para generar la serie de Fibonacci y calcular la suma
# Autor: Maykol Alejandro Riveros Navarrete

.data
msgCantidad: .asciiz "¿Cuántos números de la serie Fibonacci desea generar? "
msgSerie:    .asciiz "Serie Fibonacci: "
msgSuma:     .asciiz "\nLa suma de la serie es: "
espacio:     .asciiz " "

.text
.globl main

main:
    # Pedir cantidad
    li $v0, 4
    la $a0, msgCantidad
    syscall

    li $v0, 5
    syscall
    move $t0, $v0   # $t0 = cantidad de términos

    li $t1, 0       # primer término
    li $t2, 1       # segundo término
    li $t3, 0       # contador
    li $t4, 0       # suma

    # Mostrar mensaje inicial
    li $v0, 4
    la $a0, msgSerie
    syscall

loop_fib:
    beq $t3, $t0, fin_fib

    # Imprimir término actual ($t1)
    li $v0, 1
    move $a0, $t1
    syscall

    # Imprimir espacio
    li $v0, 4
    la $a0, espacio
    syscall

    # Sumar a la suma total
    add $t4, $t4, $t1

    # Calcular siguiente término
    add $t5, $t1, $t2
    move $t1, $t2
    move $t2, $t5

    addi $t3, $t3, 1
    j loop_fib

fin_fib:
    # Mostrar suma
    li $v0, 4
    la $a0, msgSuma
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall
