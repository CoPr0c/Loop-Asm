.data
    msg: .asciiz "Loop encerrado com sucesso!"
    esp: .byte ','
.text
for:
    addi $t0, $zero, 0 		# t0 = 0

loop:
    bgt $t0, 10, exit 		# Se t0 for maior que 10 entre na funcao exit.	
    jal printfnum 		# Chama a function.
    addi $t0, $t0, 1		# i = i + 1
    j loop 			# Volta para a funcao loop.
    
    exit:
    li $v0, 4			# Preparando o processador para receber uma string.
    la $a0, msg			# Lendo endereço da memória da variável msg.
    syscall			# Executando instrucoes.
    li $v0, 10			# Preparando o processador para encerrar o programa.
    syscall			# Executando instrucao.
    
    printfnum: 
    li $v0, 1 			# Ler imediatamente o registrador v0 = 0.
    add $a0, $t0, $zero 	# Somando t0 + zero e armazenando em a0.
    syscall			# Executando instrucao.
    li $v0, 4			# Preparando o processador para receber um char e imprimir.
    la $a0, esp			# Lendo endereço de memória da variável esp e armazenando em a0.
    syscall			# Executando instrucoes.
    jr $ra			# Retorna a funcao printfnum.
    
