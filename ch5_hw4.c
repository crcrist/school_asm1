#include <stdio.h>

int main(void) {
    int ans = 0;
    int x, y, i;

    // Example input values
    x = 1;
    y = 3;

    if (y != 0) {
        i = 1;
        do {
            ans = ans + x;
            i++;
        } while (i <= y);
    }

    printf("ans = %d\n", ans);
    return 0;
}
