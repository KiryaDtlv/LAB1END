DIR_BUILD = ./build
DIR_TEST = ./build/test
DIR_BIN = bin/program
CPP = -Wall -Werror
DIR_S = ./src
TEST = bin/test

all:clean $(DIR_BIN)/main

$(DIR_BIN)/main: $(DIR_BUILD)/Main.o $(DIR_BUILD)/Form.o $(DIR_BUILD)/Math.o $(DIR_BUILD)/intersection.o
	gcc $(CPP)  $(DIR_BUILD)/Main.o $(DIR_BUILD)/intersection.o $(DIR_BUILD)/Form.o $(DIR_BUILD)/Math.o -o $(DIR_BIN)/main -lm

$(DIR_BUILD)/Main.o: src/Main.c
	gcc $(CPP) -c src/Main.c -o $(DIR_BUILD)/Main.o

$(DIR_BUILD)/Math.o: src/Math.c
	gcc $(CPP) -c src/Math.c -o $(DIR_BUILD)/Math.o

$(DIR_BUILD)/Form.o: src/Form.c
	gcc $(CPP) -c src/Form.c -o $(DIR_BUILD)/Form.o

$(DIR_BUILD)/intersection.o: src/intersection.c
	gcc $(CPP) -c src/intersection.c -o $(DIR_BUILD)/intersection.o -lm

$(DIR_TEST)/main.o: test/Main.c
	gcc $(CPP) -I thirdparty -c test/Main.c -o $(DIR_TEST)/Main.o

$(DIR_TEST)/test_inter.o: test/test_inter.c
	gcc $(CPP) -I thirdparty -I src -c test/test_inter.c -o $(DIR_TEST)/test_inter.o

$(TEST): $(DIR_TEST)/test_inter.o $(DIR_TEST)/Main.o
	gcc $(CPP) $(DIR_S)/Form.o $(DIR_S)/Math.o $(DIR_S)/intersection.o $(DIR_TEST)/test_inter.o $(DIR_TEST)/Main.o -o $(TEST) -lm

clean:
	rm -rf $(DIR_BUILD)/*.o
	rm -rf $(DIR_TEST)/*.o
	rm -rf bin/*
	
.PHONY: all clean
