.text

fact:
	movq %rdi, %rcx
	movl $1, %eax
	cmpq $0, %rcx
	jz ret
	mult:
		mulq %rcx
	loop mult
	ret:
		ret

.global main

main:
	call fact
	ret
