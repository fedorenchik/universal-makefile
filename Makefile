all:

CFLAGS += -Wall -Wextra -ggdb3 -O0
CXXFLAGS += $(CFLAGS)
LDFLAGS += -lm -pthread

binaries := $(basename $(wildcard *.c *.cpp *.cc *.c++ *.cxx *.C))

all: $(binaries)

clean:
	rm -f $(binaries)

.PHONY: all clean
