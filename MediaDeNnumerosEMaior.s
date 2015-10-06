.data
	ms1: .asciiz"\nDigite um numero: "
	msg2: .asciiz"\nMaior: "
	msg3: .asciiz"\nMedia: "
.text
main:
	#Fazer, em Assembly Mips, um algoritmo que leia n números inteiros positivos e mostre a média e o maior numero digitado.
	#0 ou número negativo encerram a entrada de números
	
	#*Limpar os registradores quando for executar novamente.*
	
	leitura:
	#exibindo mensagem de entrada
	li $v0, 4
	la $a0, ms1
	syscall
	
	li $v0, 5
	syscall
	#Armazenando numero digitado no $t1
	add $t1, $v0, $zero
	
	#se o numero digitado for menor igual a 0, pula pro fimse
	ble $t1, 0, fimse	
	#senao, continua...
	
	#SE T8 FOR ZERO, faz comparacao entre os dois ultimos digitados
	beq $t8, $zero, fazComparacaoDoisUltimos
	#Se não, pula pro naofazcomparacaodoisultimos
	j naofazcomparacaodoisultimos
	
	fazComparacaoDoisUltimos:
	#se o numero digitado for maior = que o t2(numero digitado anteriormente), ele será o maior
	bge $t1, $t2, seformaior
	j seformenor
	
	seformaior:
	#adiciona o primeiro numero pro maior($t8)
	add $t8, $t1, $zero
	j fimmaior
	#SE T8 FOR ZERO
	
	seformenor:
	#adiciona o segundo numero pro maior($t8)
	add $t8, $t2, $zero
	
	fimmaior:
	#Pulando para o fimatualmaior para não verificar qual é o maior novamente
	j fimatualmaior
	#FIM COMPARACAO DOIS ULTIMOS
	naofazcomparacaodoisultimos:
	
	#Verificação maior se já tiver um valor no $t8(Que armazena o maior valor)
	bge $t1, $t8, atualmaior
	#se não for maior, o valor do t8 continuará igual e pulará para fimatualmaior
	j fimatualmaior
	
	atualmaior:
	add $t8, $t1, $zero
	
	fimatualmaior:
	
	#soma dos numeros para fazer a media
	add $t5, $t5, $t1 
	
	#cont
	add $t4, $t4, 1
	
	
	#armazenando ultimo numero digitado para comparar no comeco
	add $t2, $t1, $zero
	
	#se o numero digitado no comeco for > 0, volta para o comeco
	bgt $t1, $zero, leitura
	
	fimse:
	
	
	#fazendo a media e armazenando em $t6
	div $t6, $t5,$t4
	
	#mostrando mensagem 3
	li $v0, 4
	la $a0, msg3
	syscall
	
	#mostrando a media
	li $v0, 1
	add $a0, $t6, 0
	syscall
	
	#mostrando mensagem 2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#mostrando o maior
	li $v0, 1
	add $a0, $t8, 0
	syscall
	
	
	
	
	
	
	
	