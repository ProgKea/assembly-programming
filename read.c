#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void)
{
    char *buf = malloc(1);
    read(STDIN_FILENO, buf, 1);
    printf("%s\n", buf);
    free(buf);
    return 0;
}
