#include <math.h>
#include <stdlib.h>

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
