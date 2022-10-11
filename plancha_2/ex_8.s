		.data
format: .asciz "%ld\n"
formathex: .asciz "%.0x\n"
i:			.quad 0xDEADBEEF

.text
.global main

main:
				#exmp args printf
				movq $format, %rdi
				movq $1234, %rsi
				xorq %rax, %rax
				call	printf

				#print value of the registre rsp (stack)
				movq $format, %rdi
				movq %rsp, %rsi
				xorq %rax, %rax
				call	printf
				
				#print value of format
				movq $format, %rdi
				movq $format, %rsi
				xorq %rax, %rax
				call	printf

				#print value of format (hex)
				movq $formathex, %rdi
				movq $format, %rsi
				xorq %rax, %rax
				call	printf

				#print the top value of the stack
				movq $formathex, %rdi
				movq (%rsp), %rsi
				xorq %rax, %rax
				call	printf

				#print the top value of the stack shifted 8 bytes
				movq $formathex, %rdi
				movq 8(%rsp), %rsi
				xorq %rax, %rax
				call	printf

				#print the value of i
				movq $formathex, %rdi
				movq i, %rsi
				xorq %rax, %rax
				call	printf

				#print the value of i (direction)
				movq $formathex, %rdi
				movq $i, %rsi
				xorq %rax, %rax
				call	printf

				ret	
