#include <stdio.h>

int sum(int x, int y) {

        int result = x + y;
        return result;

}

int main(void) {

        int x = 4;
        int y = 5;

        int result = sum(x, y);

        printf("The sum is: %d\n", result);

        return 0;

}
