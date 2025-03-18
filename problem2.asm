extern printf
extern scanf
section .rodata
msg db "The result is : %d", 10, 0
scan db "%d", 0
section .bss
N resq 1               
section .text
global main
main:
	 push rbp
	 mov rbp, rsp
	
	 
	 mov rdi, scan
	 mov rsi, N
	 call scanf
	 mov rcx, [N]
	 inc rcx
         
	 xor rbx, rbx
	 xor rdx, rdx
L:
         add rbx, rdx
   	 inc rdx
	 loop L
    

exit:
   	 mov rdi, msg
   	 mov rsi, rbx
   	 call printf

   	 xor rax, rax       
   	 mov rsp, rbp
   	 pop rbp
   	 ret

