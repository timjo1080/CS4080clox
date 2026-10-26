# Simple Makefile for clox. Builds every .c file in this folder.
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -g

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
TARGET = clox

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Run the ternary test file.
test: $(TARGET)
	./$(TARGET) test.lox

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all test clean