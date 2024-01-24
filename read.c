#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main(void)
{
    int file = open("input.txt", 0);
    printf("File descriptor: %d\n", file);
    char *buffer = malloc(4);
    read(file, buffer, 4);
    printf("%s\n", buffer);
    return 0;
}
