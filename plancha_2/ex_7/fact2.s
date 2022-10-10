.global fact2
fact2:
	movq %rdi, %rcx
	movl $1, %eax
	cmpq $0, %rcx
	jz ret
	mult:
		mulq %rcx
	loop mult
	ret:
		ret






