.data
	msg1: .asciiz"\nMaior dos numeros: "
.text
main:
	li $t0,100
	li $t1, 20
	
	bge $t0, $t1, se
	j senao
	
	se:
	li $v0, 4
	la $a0, msg1
	syscall
	
	
	li$ v0, 1
	add $a0, t0, 0
	syscall
	j fimse
	
	senao:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	fimse:
	