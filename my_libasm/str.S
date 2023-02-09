section .text
    ; declare functions
    global my_memset
    global my_memmove
    global my_memcpy

    global my_index
    global my_strncmp
    global my_strcasecmp


; Using memset function
my_memset:
	xor	rax, rax                

    loop_memset:                
        cmp	rax, rdx            
        jz	return_memset       
        mov	[rdi + rax], sil       
        inc	rax                 
        jmp	loop_memset       

    return_memset:             
        lea	rax, [rdi]         
        ret                     

; Using memmove function
my_memmove:
	xor	rcx, rcx           
	cmp	rdx, rcx 	        
	jz	return_memmove     
	mov	r10, r10	       
	sub	r10, rsi	        
	cmp	r10, rcx	      
	jg	copy_reverse        
	
    copy_mem:               
        dec	rdx             
        mov	al, [rsi + rcx] 
        mov	[rdi + rcx], al 
        inc	rcx             
        cmp	rdx, 0          
        jz	return_memmove  
        jmp	copy_mem        
        
    copy_reverse:          
        dec	rdx             
        mov	al, [rsi + rdx] 
        mov	[rdi + rdx], al 
        cmp	rdx, rcx	    
        js	return_memmove  
        jmp	copy_reverse    

    return_memmove:        
        mov	rax, rdi        
        ret                 

; Using memcpy  function
my_memcpy:
	xor	rcx, rcx               
    
    loop_memcpy:                
        cmp	rcx, rdx            
        jz	return_memcpy       
        mov	al, byte[rsi + rcx] 
        mov	[rdi + rcx], byte al 
        inc	rcx                 
        jmp	loop_memcpy          

    return_memcpy:              
        mov	rax, rdi           
        ret                     

; Using index similar to strchr function
my_index:               
    xor rax, rax
    loop_index:                        
        cmp byte[rdi + rax], 0          
        jz end_index                    
 
        cmp byte[rdi + rax], sil       
        jz good_index                   

        inc rax                         
        jmp loop_index                  

    good_index:                         
        lea rax, [rdi + rax]            
        ret                            

    end_index:                          
        xor rax, rax                    
        ret                              

; Using strncmp function
my_strncmp:
	xor	rcx, rcx                       
    count_n:                           
        cmp	rdx,rcx                   
        jz	return_error                
        mov	al, [rdi + rcx]           
        cmp	byte[rdi + rcx], 0     
        jz	return_n                    
        cmp	byte[rsi + rcx], 0          
        jz	return_n                    
        cmp	al, byte[rsi + rcx]        
        jz	increment_n                

    return_n:                          
        sub	al, byte[rsi + rcx]      
        movsx	rax, al                 
        ret                             

    return_error:                   
        xor	rax, rax                   
        ret                            
        
    increment_n:                    
        inc	rcx                        
        jmp	count_n                    

; Using strcasecmp function
my_strcasecmp:         
	cmp	rdx, 0                        
	jz	return_error                   
	mov	r10, rdi                     
	
    count_casecmp:                    
        cmp	rdx, 0                     
        jz	return_casecmp             
        movzx rdi, byte[r10]           
        call  to_lower_case            
        mov	bl, al                     
        movzx	rdi, byte[rsi]         
        call	to_lower_case          
        cmp	bl, 0                    
        jz	return_casecmp            
        cmp	al, 0                      
        jz	return_casecmp             
        cmp	bl, al                    
        jz	increment_casecmp          

    return_casecmp:              
        sub	bl, al                     
        movsx	rax, bl               
        ret                             
        
    return_casecmp_error:       
        xor	rax, rax            
        ret                    
        
    increment_casecmp:	    
        inc	r10                
        inc	rsi                 
        dec	rdx                 
        jmp	count_casecmp      
        
    to_lower_case:       
        mov	rax, rdi                
        sub	rdi, 65                
        cmp	rdi, 25                 
        jbe	return_transform        
        jmp	return_normal           

    return_transform:               
        add	rax, 32                 

    return_normal:                  
        ret                         


