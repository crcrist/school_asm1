#include <stdio.h>

int main(void) {
    int array1[20] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19};
    int array2[20];

    size_t array_total_size = sizeof(array1);
    size_t element_size = sizeof(array1[0]);

    size_t array_length = array_total_size / element_size;

    // Example input values
    for (int i = 0; i < array_length; i++) {
        array2[i] = array1[i];
        printf("ans = %d\n", array2[i]);
    };
    
    return 0;
}
