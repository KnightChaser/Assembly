#include <stdio.h>
#include <stdbool.h>

bool isPrimeNumber(int number) {

        for (int j = 2; j < number; j++) {
                if (number % j == 0)
                        return false;
        }

        return true;

}

int main(void) {

        int number;
        printf("Enter the upper limit: ");
        scanf("%d", &number);

        for (int i = 2; i < number; i++) {
                if (isPrimeNumber(i))
                        printf("%d\n", i);
                else
                        continue;
        }

        return 0;

}
