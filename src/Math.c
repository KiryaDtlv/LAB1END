#include <stdio.h>
#define p 3.14
int PS(int r)
{
	float S;
    if (r <= 0) {
    	printf("Неверный радиус!");
        return 1;
    } else
	S = p * r * r;
    	printf("Площадь %0.2f", S);
    	float P = 2 * p * r;
    	printf("Периметр %0.2f", P);
        return 0;
}
