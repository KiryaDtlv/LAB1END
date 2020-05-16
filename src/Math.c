int PS(int r)
{
    if (r <= 0) {
    	printf("Неверный радиус!");
        return 1;
    } else
    	float S = p * r * r;
    	printf("%0.2f", S);
    	float P = 2 * p * r;
    	printf("%0.2f", P);
        return 0;
}
