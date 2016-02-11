CPP_FILES := $(wildcard lib/src/*.cpp)
OBJ_FILES := $(addprefix lib/obj/,$(notdir $(CPP_FILES:.cpp=.o)))
CC_FLAGS := -O2 -ggdb -std=c++11

build: main 

run: main
	sudo ./main

main: main.o $(OBJ_FILES)
	g++-4.8 $(LD_FLAGS) -o $@ $^

main.o: main.cpp Makefile
	g++-4.8 $(CC_FLAGS) -c -o $@ $<

lib/obj/%.o: lib/src/%.cpp Makefile
	@mkdir -p lib/obj
	g++-4.8 $(CC_FLAGS) -c -o $@ $<
