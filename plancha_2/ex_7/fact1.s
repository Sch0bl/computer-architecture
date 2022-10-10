.text

fact:
	cmpq $0, %rdi
	jz base_fact
	subq $1, %rdi
	call fact
	addq $1, %rdi
	mulq %rdi
	ret

base_fact:
	movl $1, %eax
	ret

.global main

main:
	call fact
	ret
	
