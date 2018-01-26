#include <stdio.h>
#include <limits.h>

int saturating_add(int x, int y) { 
  int size = sizeof(int)<<3;
  int sum;
  int x_sign = (x>>(size - 1)) & 0x01;
  int didOverflow = __builtin_add_overflow(x, y, &sum);
  int afterOverflow = ~didOverflow + 1;
  int after_x_sign = ~x_sign + 1;
  int overflow = INT_MAX ^ after_x_sign;
  overflow = afterOverflow & overflow;
  sum = (~afterOverflow) & sum;
  return overflow | sum;
}





