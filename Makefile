CC = gcc
CFLAGS = -Wall -Wextra -g

SRCS = main.c chunk.c debug.c memory.c value.c vm.c
OBJS = $(SRCS:.c=.o)

# Everything except main.o, so test programs can supply their own main().
LIB_OBJS = chunk.o debug.o memory.o value.o vm.o

clox: $(OBJS)
	$(CC) $(CFLAGS) -o clox $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

run: clox
	./clox

test: $(LIB_OBJS) test.o
	$(CC) $(CFLAGS) -o run_tests test.o $(LIB_OBJS)
	./run_tests

test_stack: $(LIB_OBJS) test_stack.o
	$(CC) $(CFLAGS) -o run_stack_tests test_stack.o $(LIB_OBJS)
	./run_stack_tests

clean:
	rm -f $(OBJS) test.o test_stack.o clox run_tests run_stack_tests

.PHONY: run test test_stack clean