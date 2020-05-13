#include <string.h>

int Form(char name[])
{
    if (strncmp(name, "circle", 6) == 0) {
        return 0;
    } else
        return 1;
}
