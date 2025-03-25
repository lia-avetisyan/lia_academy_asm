	extern printf
	extern scanf

	section .rodata
	msg db "The Fibonacci number is: %d", 10, 0   
	scan db "%d", 0                          

	section .bss
	num resq 1        
	num1 resq 1       
	num2 resq 1
	res resq 1        

	section .text
	global main
	main:
	push rbp                  
        mov rbp, rsp              

        mov rdi, scan           
        mov rsi, num              
        call scanf                

    
        mov rax, [num]            
        cmp rax, 0                
        je fib_zero               

        cmp rax, 1                
        je fib_onetwo         
        cmp rax, 2                
        je fib_onetwo         

        mov rax, 1               
        mov [num1], rax          
        mov [num2], rax           
        mov rbx, 3              

fib_loop:
        mov rax, [num1]         
        add rax, [num2]           
        mov [res], rax            

        mov rax, [num2]          
        mov [num1], rax          
        mov rax, [res]            
        mov [num2], rax          

        inc rbx                   
        cmp rbx, [num]           
        jle fib_loop              

fib_exit:
    
        mov rdi, msg             
        mov rsi, [res]            
        call printf               

  
        xor rax, rax 
        mov rsp, rbp 
        pop rbp
        ret

fib_zero:
   
        mov rdi, msg  
        xor rsi, rsi  
        call printf   
        xor rax, rax  
        mov rsp, rbp  
        pop rbp       
        ret 

fib_onetwo:
  
        mov rdi, msg      
        mov rsi, 1  
        call printf  
        xor rax, rax     
        mov rsp, rbp     
        pop rbp 
        ret     

