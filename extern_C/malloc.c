#include <stdio.h>
#include <stdlib.h>

int main(void) {

        int* integerArray = (int *)malloc(sizeof(int) * 0x4);

        integerArray[0] = 0;
        integerArray[1] = 1;
        integerArray[2] = 2;
        integerArray[3] = 3;

        for(int i = 0; i <= 3; i++)
                printf("integerArray[%d]: %d\n", i, integerArray[i]);

        free(integerArray);

        return 0;

}
