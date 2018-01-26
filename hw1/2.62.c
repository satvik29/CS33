#include <stdio.h>
int int_shifts_are_arithmetic() {
int x = -1;
x = x >> 1;
if (x >= 0) {
return 0;
} else {
return 1;
}
}
