#include "Form.h"
#include "Math.h"
#include "intersection.h"
#include <stdio.h>
#define p 3.14
int main()
{
    int r1, r2;
    int x1, x2;
    int y1, y2;
    char name[15];
    printf("Название фигуры: ");
    scanf("%s", name);
    if (Form(name) == 0) {
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
        PS(r1);
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
        PS(r2);
    } else {
        printf("Ошибка ввода фигуры! Доступные фигуры: circle");
        return 0;
    }
    printf("%s(%d, %d, %d)\n", name, x1, y1, r1);
    printf("%s(%d, %d, %d)\n", name, x2, y2, r2);
    int peres = Intersection(x1, y1, x2, y2, r1, r2);
    if (peres == 0) {
        printf("\nОкружности пересекаются\n");
    } else
        printf("\nОкружности не пересекаются\n");
}
