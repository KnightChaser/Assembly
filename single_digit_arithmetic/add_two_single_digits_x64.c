#include <stdio.h>

int main(void) {

        // Only a single byte for single digit
        char number1[2];
        char number2[2];
        char result;

        printf("Enter the 1st digit: ");
        scanf("%s", number1);               // include NULL(\n)

        printf("Enter the 2nd digit: ");
        scanf("%s", number2);

        int temp = (number1[0] - '0') + (number2[0] - '0');
        result = (char)temp;

        printf("1st digit + 2nd digit: %d", result);

        return 0;

}
