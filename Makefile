# Makefile for clox. Builds main.c and every other .c file in this folder.
CC = gcc
CFLAGS = -Wall -Wextra -Wno-unused-parameter -std=c99 -g -MMD -MP

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)
TARGET = clox

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Build and run the REPL.
run: $(TARGET)
	./$(TARGET)

# Build and run test.lox.
test: $(TARGET)
	./$(TARGET) test.lox

clean:
	rm -f $(OBJS) $(DEPS) $(TARGET)

# Header dependency files, so editing a .h rebuilds what needs it.
-include $(DEPS)

.PHONY: all run test clean