#include <stdio.h>
#include <time.h>

#include "object.h"
#include "table.h"
#include "value.h"
#include "vm.h"

static void run(int n) {
  ObjString* keys[1000];
  Table t;
  Value out;
  char buf[32];


  initTable(&t);
  for (int i = 0; i < n; i++) {
    keys[i] = copyString(buf, snprintf(buf, sizeof(buf), "key%d", i));
    tableSet(&t, keys[i], NUMBER_VAL(i));
  }

  // number of reps adjusted so that the total number of lookups is the same in both cases
  int reps = 10000000 / n;
  clock_t start = clock();
  for (int r = 0; r < reps; r++)
    for (int i = 0; i < n; i++) tableGet(&t, keys[i], &out);

  double ms = (double)(clock() - start) * 1000.0 / CLOCKS_PER_SEC;
  printf("%d keys: %.1f ms\n", n, ms);
  freeTable(&t);
}

int main(void) {
  initVM();
  // test w/ 100 entries, then 1000 entries.  The number of repetitions is adjusted so that the total number of lookups is the same in both cases.
  run(100);
  run(1000);
  freeVM();
  return 0;
}