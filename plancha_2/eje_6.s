.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length: .byte 10
format: .asciz "%d\n"

.text
suma:
	xorq %rax, %rax
	xorq %rcx, %rcx
	call suma_loop
	ret
suma_loop:
	addl (%rdi,%rcx,4), %eax
	incb %cl
	cmpb %sil, %cl
	jne suma_loop
	ret

max:
	xorq %rax, %rax
	xorq %rcx, %rcx
	call max_loop
	ret

max_loop:
	cmpl %eax, (%rdi,%rcx,4)
	cmova (%rdi,%rcx,4), %eax
	incb %cl
	cmpb %sil, %cl
	jne max_loop
	ret
	
min:
	movl $0xffffffff, %eax
	xorq %rcx, %rcx
	call min_loop
	ret

min_loop:
	cmpl (%rdi,%rcx,4), %eax
	cmova (%rdi,%rcx,4), %eax
	incb %cl
	cmpb %sil, %cl
	jne min_loop
	ret

average:
	call suma
	xorq %rdx, %rdx
	divq %rsi
	ret

set_printf:
	movq %rax, %rsi
	movq $format, %rdi
	xorq %rax, %rax
	ret
	
set_list:
	movq $list, %rdi 
	xorq %rsi, %rsi
	movb length, %sil
	ret


.global main
main:
	call set_list
	call suma
	call set_printf
	call printf
	call set_list
	call max
	call set_printf
	call printf
	call set_list
	call min
	call set_printf
	call printf
	call set_list
	call average
	call set_printf
	call printf
	ret


