#include "my_libasm.h"
#include <stdio.h>
#include <fcntl.h>

int func_read()
{
    int file_d = open("test.txt", O_RDONLY);
    char storage[56]={0};
    if(my_read(file_d, storage, 56) < 0)
     return 0;
    printf("%s\n", storage); //result result: read file 
    return 0;
}

int  func_write()
{
    char *out_file = "Hello NASM 64\n";
    if(my_write(1, out_file, my_strlen(out_file)) < 0)
    return 1;
     //result output: Hello NASM 64
    return 0;
}

int func_index()
{
    char* temp = "Hello NASM";
    temp = my_index(temp, 'N');
    printf("%s\n", temp); //result output: ASM
    return 0;
}

int func_memset()
{
    int j=0;
    char array[10];
    my_memset(array, 'o', 10);
    while(j<10){
        printf("%c\t", array[j]); //result output: o o o o o o o o o o
    j++;
}
return 0;
}

int  func_strlen()
{
    printf("\nlen: %d\n", my_strlen("Hello ASM")); //result output: 9
    return 0;
}
int func_strcmp()
{
printf("compare: %d\n", my_strcmp("Compare str", "Compare str")); // result output: 0
return 0;
}

int main()
{

    func_read();

    func_write();

    func_index();

    func_memset();

    func_strlen();

    func_strcmp();
        
        return 0;
}