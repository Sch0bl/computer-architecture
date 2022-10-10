.global fact1

fact1:
	cmpq $0, %rdi
	jz base_fact
	subq $1, %rdi
	call fact1
	addq $1, %rdi
	mulq %rdi
	ret

base_fact:
	movl $1, %eax
	ret
