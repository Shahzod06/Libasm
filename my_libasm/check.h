#ifndef LIBASM_H
# define LIBASM_H
# include <unistd.h>

int		my_strlen(char* str);
char*		ft_strcpy(char* dest,  char* src);
int		my_write(int file_d, void* str, int len);
int		my_read(int file_d, void* str, int len);
char*		ft_strdup( char* str);
int			ft_strcmp( char* str1,  char* str2);
#endif