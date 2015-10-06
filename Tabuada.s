.data
	quebra: .asciiz"\n"
.text
main:
	li $t0, 9
	li $t1, 0
	li $t5, 1
	
	bge $t0, $t1, enquanto
	j fimenquanto
	
	enquanto:
	mul $t2, $t0, $t1
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	
	li $v0, 4
	la $a0, quebra
	syscall
	
	add $t1, $t1, $t5
	ble $t1, 10, enquanto
	fimenquanto: