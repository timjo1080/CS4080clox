#include <stdio.h>
#include "vm.h"

void push(Value value);   // in case vm.h doesn't declare them
Value pop();

int main(void) {
  initVM();

  for (int i = 0; i < 1000; i++) push(i);   // old stack held only 256

  for (int i = 999; i >= 0; i--) {
    if (pop() != i) {
      printf("FAIL at %d\n", i);
      return 1;
    }
  }

  printf("PASS\n");
  freeVM();
  return 0;
}