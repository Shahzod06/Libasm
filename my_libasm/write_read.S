section .text
    global my_read
    global my_write


; Using the read function <(*_*)>
my_read:
  mov  rax, 0  
  syscall     ; system call: http://laihoconsulting.com/blog/2021-08-getting-started-with-x64-assembly/
    ret         
; Using the write function (+_+)
my_write:
  mov  rax, 1  
  syscall     ; system call: https://www.youtube.com/watch?v=e2FOQqDOzDQ
    
    ret         