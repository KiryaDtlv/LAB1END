CPPFLAGS = -Wall -Werror
DIR_S = build/src

all: $(PROG) $(TEST)

$(PROG): $(DIR_S)/Main.o $(DIR_S)/Form.o $(DIR_S)/Math.o $(DIR_S)/intersection.o
	gcc $(CPPFLAGS) $(DIR_S)/Main.o $(DIR_S)/intersection.o $(DIR_S)/Form.o $(DIR_S)/Math.o -o $(PROG) -lm

$(DIR_S)/main.o: src/Main.c
	gcc $(CPPFLAGS) -c src/Main.c -o $(DIR_S)/Main.o

$(DIR_S)/Figure.o: src/Form.c
	gcc $(CPPFLAGS) -c src/Form.c -o $(DIR_S)/Form.o

$(DIR_S)/Circle.o: src/Math.c
	gcc $(CPPFLAGS) -c src/Math.c -o $(DIR_S)/Math.o

$(DIR_S)/Intersection.o: src/intersection.c
	gcc $(CPPFLAGS) -c src/intersection.c -o $(DIR_S)/intersection.o -lm

clean:
	rm -rf $(DIR_S)/*.o
	rm -rf bin/*

.PHONY: all clean
