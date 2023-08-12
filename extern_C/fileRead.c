// filename: fileRead.c
// compile: gcc -o fileRead fileRead.c -fno-stack-protector -no-pie
#include <stdio.h>

#define MAX_READ_LIMIT  1000

int main(void) {

        FILE *fp = fopen("./example.txt", "r");
        char buffer[MAX_READ_LIMIT] = { 0, };

        fread(buffer, 1, MAX_READ_LIMIT, fp);
        printf("%s", buffer);

        fclose(fp);

}
