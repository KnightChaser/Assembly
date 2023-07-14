#include <stdio.h>

int main(void) {

        int number = 1234567890;

        char stringifiedNumber[128] = {0,};
        int i = 0;

        int temp = number;
        int length = 0;

        while(temp != 0) {
                temp = temp / 10;
                length++;
        }

        while(number != 0) {
                *(stringifiedNumber + (length - i) - 1) = number % 10 + 48;     // To ASCII
                number = number / 10;
                i++;
        }

        *(stringifiedNumber + length + i) = '\0';                               // NULL append
        printf("%s\n", stringifiedNumber);

        return 0;

}
