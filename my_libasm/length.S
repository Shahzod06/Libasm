section .text
    global my_strlen
    global my_strcmp
    global my_strchr

; Using strlen function
my_strlen:
    push  rcx           
    xor   rcx, rcx    

    strlen_next:   

    cmp   [rdi], byte 0  
    jz    strlen_null    

    inc   rcx        
    inc   rdi           
    jmp   strlen_next   

    strlen_null:       

    mov   rax, rcx     
    pop   rcx        
    ret              

; Using strcmp function
my_strcmp:
	xor	rcx, rcx    
	
    count_cmp:      
        mov	al, [rdi + rcx]     

        cmp	byte[rsi + rcx], 0  
        jz	return_cmp         
      
        cmp	byte[rdi + rcx], 0  
        jz	return_cmp         
  
        cmp	al, byte[rsi + rcx]  
        jz	increment          

    return_cmp:               
        sub	al, byte[rsi + rcx] 
        movsx	rax, al
        ret

    increment:      
        inc	rcx     
        jmp	count_cmp 


; Using strchr function
my_strchr:
        xor rax, rax            

    loop_strchr:               
        cmp byte[rdi + rax], 0  
        jz end                 
 
        cmp byte[rdi + rax], sil   
        jz return_strchr

        inc rax                 
        jmp loop_strchr         

    return_strchr:
        lea rax, [rdi + rax]   
        ret                    

    end:
        xor rax, rax          
        ret                     
