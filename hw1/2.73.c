#include <stdio.h>
#include <limits.h>

int saturating_add(int x, int y);

int main() {
    int x = INT_MIN; 
    int y = -1;
    int result = saturating_add(x, y);
    printf("%d", result);
    return saturating_add(x, y);
}

int saturating_add(int x, int y) {
    int result = x + y;
    int right_shift = sizeof(x) << 3;
    int masked_val = 1 << (right_shift - 1);
    int xmsb = x & masked_val;
    int ymsb = y & masked_val;
    int resultmsb = result & masked_val;
    int posovf = ~xmsb & ~ymsb & resultmsb;
    int negovf = xmsb & ymsb & ~resultmsb;
    posovf && (result == INT_MAX);
    negovf && (result == INT_MIN);
    return result;
}
