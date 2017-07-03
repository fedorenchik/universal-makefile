c_cpp_wildcards := *.c *.cpp *.cc *.c++ *.cxx *.C
most_recent_source := $(shell ls -At $(wildcard $(c_cpp_wildcards)) | head -1)

.DEFAULT_GOAL := $(basename $(most_recent_source))
CFLAGS += -Wall -Wextra -ggdb3 -O0
CXXFLAGS += $(CFLAGS)
LDFLAGS += -lm -pthread

binaries := $(basename $(wildcard $(c_cpp_wildcards)))

all: $(binaries)

clean:
	rm -f $(binaries)

help:
	@echo 'make            build most recent source ($(most_recent_source))'
	@echo 'make <prog>     build prog.c[c|pp|xx|++]|C?'
	@echo 'make all        build all sources'
	@echo 'make clean      remove all binaries'
	@echo 'make help       show this help'

.PHONY: all clean help
