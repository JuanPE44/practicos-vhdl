.data
dummy:    .word 0      # Posición 0
limite:   .word 10     # Posición 4 → Mem[4]
resultado: .word 0     # Posición 8 → para guardar el resultado (opcional)

.text
main:
    lw $t0, 4($zero)    # Cargar límite de la sumatoria desde Mem[4]
    li $t1, 1           # i = 1
    li $t2, 0           # suma = 0

loop:
    bgt $t1, $t0, end   # si i > límite → salir
    add $t2, $t2, $t1   # suma += i
    addi $t1, $t1, 1    # i++
    j loop

end:
    sw $t2, 8($zero)     # guardar resultado en Mem[8]

