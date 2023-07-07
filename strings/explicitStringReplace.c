#include <stdio.h>

int main() {
    
    char name[] = "KnightChaser";
    
    printf("%s\n", name);
    
    name[6]  = (char)'R';
    name[7]  = (char)'i';
    name[8]  = (char)'d';
    name[9]  = (char)'e';
    name[10] = (char)'r';
    name[11] = (char)'\0';
    
    printf("%s\n", name);
    
    return 0;
    
}
