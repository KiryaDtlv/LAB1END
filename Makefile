DIR_BUILD = ./build
DIR_TEST = ./build/test
DIR_BIN = ./bin
DIR_S= ./src
TEST = ./bin/test

all:clean $(DIR_BIN)/main run

$(DIR_BIN)/main: $(DIR_BUILD)/Main.o $(DIR_BUILD)/Form.o $(DIR_BUILD)/Math.o $(DIR_BUILD)/intersection.o
	gcc  $(DIR_BUILD)/Main.o $(DIR_BUILD)/intersection.o $(DIR_BUILD)/Form.o $(DIR_BUILD)/Math.o -o $(DIR_BIN)/main -lm

$(DIR_BUILD)/Main.o: src/Main.c
	gcc  -c src/Main.c -o $(DIR_BUILD)/Main.o

$(DIR_BUILD)/Math.o: src/Math.c
	gcc  -c src/Math.c -o $(DIR_BUILD)/Math.o

$(DIR_BUILD)/Form.o: src/Form.c
	gcc  -c src/Form.c -o $(DIR_BUILD)/Form.o

$(DIR_BUILD)/intersection.o: src/intersection.c
	gcc -c src/intersection.c -o $(DIR_BUILD)/intersection.o -lm

$(DIR_TEST)/main.o: test/Main.c
	gcc -I thirdparty -c test/Main.c -o $(DIR_TEST)/Main.o

$(DIR_TEST)/test_inter.o: test/test_inter.c
	gcc -I thirdparty -I src -c test/test_inter.c -o $(DIR_TEST)/test_inter.o

$(TEST): $(DIR_TEST)/test_inter.o $(DIR_TEST)/Main.o
	gcc $(DIR_S)/Form.o $(DIR_S)/Math.h $(DIR_S)/intersection.h $(DIR_TEST)/test_inter.o $(DIR_TEST)/Main.o -o $(TEST) -lm

clean:
	rm -rf $(DIR_BUILD)/*.o
	rm -rf $(DIR_TEST)/*.o
	rm -rf bin/*
run: 
	./$(DIR_BIN)/main
	
.PHONY: all clean
