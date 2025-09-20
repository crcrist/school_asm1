#include <stdio.h>
int main() {
	int num1, num2;
	printf("\n%s", "Enter a value for num1: ");
	scanf_s("%d", &num1);
	printf("\n%s", "Enter a value for num2: ");
	scanf_s("%d", &num2);
	printf("\n%s\n\n", "num1 num2");
	printf("%s%d%s%d\n\n", " ", num1, " ", num2);
	return 0;
}