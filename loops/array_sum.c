#include <stdio.h>

int main(void) {

        int arr1[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        int sum = 0;

        for (int i = 0; i < 10; i++) {
                sum += arr1[i];
        }

        printf("The sum of the array is: %d\n", sum);

}
