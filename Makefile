CC      = gcc
CFLAGS  = -std=c99 -Wall -Wextra -g -MMD -MP
SRC     = $(wildcard *.c)
OBJ     = $(SRC:.c=.o)
DEP     = $(OBJ:.o=.d)

clox: $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Build with AddressSanitizer to catch memory bugs
asan: CFLAGS += -fsanitize=address,undefined
asan: clean clox

run: clox
	./clox

clean:
	rm -f clox $(OBJ) $(DEP)

.PHONY: run clean asan

-include $(DEP)