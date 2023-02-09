NASM = nasm 
NASMFLG = -felf64
CC = gcc

all: str write_read length bin

str:
	$(NASM) $(NASMFLG) str.S

write_read:
	$(NASM) $(NASMFLG) write_read.S

length:
	$(NASM) $(NASMFLG) length.S

bin:
	$(CC) str.o write_read.o length.o main.c -o out

fclean:
	rm -f out *.o