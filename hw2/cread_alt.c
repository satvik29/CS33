#include <stdio.h>

long cread_alt(long *xp) {
  /* compiled using gcc -O2 cread_alt.c */
  long *rval = xp;
  long test = 0;
  long *eval = &test;
  long ntest = (xp != NULL);
  if (!ntest) rval = eval;
  return *rval;
}
