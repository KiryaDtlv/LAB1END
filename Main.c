#include <stdio.h>
#include <math.h>
int main(){
	float pi=3.14, S, P;
	int R;
	scanf("%d", &R);
	P=pi*2*R;
	S=pi*R*R;
	printf("Периметр = %f", P);
        printf("Площадь = %f", S);
	getchar();
	return 0;       
}
