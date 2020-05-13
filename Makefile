CPPFLAGS = -Wall -Werror
DIR_BUILD = ./build
DIR_BIN = ./bin
DIR_S= ./src

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

clean:
	rm -rf $(DIR_BUILD)/*.o
	rm -rf bin/*.exe
run: 
	./$(DIR_BIN)/main
	
.PHONY: all clean
