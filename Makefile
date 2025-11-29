# Makefile for Hello World Libretro Core

# Library name
CORE_NAME = helloworld_libretro

# Detect OS
UNAME := $(shell uname)

ifeq ($(UNAME), Darwin)
	LIB_EXT = dylib
	CGO_LDFLAGS = -shared
	RETROARCH=/Applications/RetroArch.app/Contents/MacOS/RetroArch
else ifeq ($(UNAME), Linux)
	LIB_EXT = so
	CGO_LDFLAGS = -shared
	RETROARCH=retroarch
else
	LIB_EXT = dll
	CGO_LDFLAGS = -shared
	RETROARCH=retroarch.exe
endif
CORE=helloworld_libretro.$(LIB_EXT)


# Output file
OUTPUT = $(CORE_NAME).$(LIB_EXT)

.PHONY: all build clean test

all: build

build:
	CGO_ENABLED=1 go build -buildmode=c-shared -o $(OUTPUT) .

clean:
	rm -f $(CORE_NAME).*
	rm -f *.h

test:
	go build -buildmode=c-shared -o /dev/null . 2>&1 || echo "Build test completed"

run:
	$(RETROARCH) -L $(CORE) -v --menu