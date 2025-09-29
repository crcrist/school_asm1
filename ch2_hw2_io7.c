#include <stdio.h>
int main() {
	int num1, num2, num3;
	printf("%s", "Enter a number: ");
	scanf_s("%d", &num1);
	printf("%s", "Enter a larger number: ");
	scanf_s("%d", &num2);
	printf("%s", "Enter an even larger number: ");
	scanf_s("%d", &num3);

	printf("\n%d%s%d%s%d", num1, " < ", num2, " < ", num3);
	printf("\n%d%s%d%s%d", num3, " > ", num2, " > ", num1);
	return 0;
}