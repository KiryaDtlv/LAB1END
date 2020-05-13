#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#define p 3.14

int Intersection(int x1, int y1, int x2, int y2, int r1, int r2)
{
    float d = sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
    if (d == 0 && r1 == r2) {
        return 1;
    } else if (d > r1 + r2) {
        return 1;
    } else if (d < abs(r1 - r2)) {
        return 1;
    } else
        return 0;
}
int Perimetr(int r)
{
    if (r <= 0) {
        return 1;
    } else
        return 0;
}

int Ploshad(int r)
{
    if (r <= 0) {
        return 1;
    } else
        return 0;
}
int Figure(char name[])
{
    if (strncmp(name, "circle", 6) == 0) {
        return 0;
    } else
        return 1;
}
int main()
{
    int r1, r2;
    float P1, P2;
    float S1, S2;
    int x1, x2;
    int y1, y2;
    int res1_1, res1_2;
    int res2_1, res2_2;
    char name[15];
    printf("Название фигуры: ");
    scanf("%s", name);
    if (Figure(name) == 0) {
        printf("Координаты первой окружности: \n");
        if (scanf("%d", &x1) != 1) {
            printf("Координаты должны быть целыми!");
            return 0;
        }
        if (scanf("%d", &y1) != 1) {
            printf("Координаты должны быть целыми!");
            return 0;
        }
        printf("Радиус: \n");
        scanf("%d", &r1);
        res1_1 = Ploshad(r1);
        if (res1_1 == 1) {
            printf("Неверный радиус!");
            return 0;
        } else
            S1 = p * r1 * r1;
        res1_2 = Perimetr(r1);
        if (res1_2 == 1) {
            printf("Неверный радиус!");
            return 0;
        } else
            P1 = p * r1 * 2;
        printf("Координаты второй окружности: \n");
        if (scanf("%d", &x2) != 1) {
            printf("Координаты должны быть целыми!");
            return 0;
        }
        if (scanf("%d", &y2) != 1) {
            printf("Координаты должны быть целыми!");
            return 0;
        }
        printf("Радиус: \n");
        scanf("%d", &r2);
        res2_1 = Ploshad(r2);
        if (res2_1 == 1) {
            printf("Неверный радиус!");
            return 0;
        } else
            S2 = p * r2 * r2;
        res2_2 = Perimetr(r2);
        if (res2_2 == 1) {
            printf("Неверный радиус!");
            return 0;
        } else
            P2 = p * r2 * 2;
    } else {
        printf("Ошибка ввода фигуры! Доступные фигуры: circle");
        return 0;
    }
    printf("%s(%d, %d, %d)\n", name, x1, y1, r1);
    printf("Площадь: %0.2f\n", S1);
    printf("Периметр: %0.2f\n\n", P1);
    printf("%s(%d, %d, %d)\n", name, x2, y2, r2);
    printf("Площадь: %0.2f\n", S2);
    printf("Периметр: %0.2f\n", P2);
    int peres = Intersection(x1, y1, x2, y2, r1, r2);
    if (peres == 0) {
        printf("\nОкружности пересекаются\n");
    } else
        printf("\nОкружности не пересекаются\n");
}










   

