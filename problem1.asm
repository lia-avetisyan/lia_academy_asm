extern printf
extern scanf
section .rodata
msg db "The result is : %d", 10, 0
scan1 db "%d", 0
scan2 db "%d", 0
scan3 db "%d", 0
section .bss
a resq 1          
b resq 1
choose resq 1          
section .text
global main
main:
    push rbp
    mov rbp, rsp

    mov rdi, scan3
    mov rsi, choose
    call scanf

    mov rdi, scan1      
    mov rsi, a        
    call scanf

    mov rdi, scan2      
    mov rsi, b        
    call scanf

    mov rbx, [a]        
    mov rcx, [b]        
    mov rdx, [choose]
    cmp rdx, 1
    je add
    cmp rdx, 2
    je sub
    cmp rdx, 3
    je mul
    cmp rdx, 4
    je div
add:
    add rbx, rcx        
    jmp exit
   
sub:
    sub rbx, rcx
    jmp exit
mul:
    xor rdx, rdx
    mov rax, rcx
    mul rbx
    mov rbx, rax
    jmp exit
div:
    cmp rbx, 0
    je exit0
    xor rdx, rdx
    mov rax, rcx
    div rbx
    mov rbx, rax
    jmp exit

exit0:
xor rax, rax
mov rsp, rbp
pop rbp
ret

exit:
    mov rdi, msg
    mov rsi, rbx
    call printf

    xor rax, rax       
    mov rsp, rbp
    pop rbp
    ret

