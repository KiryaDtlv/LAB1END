CPPFLAGS = -Wall -Werror
DIR_S = build/src
DIR_T = build/test
PROG = bin/prog
TEST = bin/test

all: $(PROG) $(TEST)

$(PROG): $(DIR_S)/Main.o $(DIR_S)/Form.o $(DIR_S)/Math.o $(DIR_S)/intersection.o
	gcc $(CPPFLAGS) $(DIR_S)/Main.o $(DIR_S)/intersection.o $(DIR_S)/Form.o $(DIR_S)/Math.o -o $(PROG) -lm

$(DIR_S)/Main.o: src/main.c
	gcc $(CPPFLAGS) -c src/Main.c -o $(DIR_S)/Main.o

$(DIR_S)/Form.o: src/Form.c
	gcc $(CPPFLAGS) -c src/Form.c -o $(DIR_S)/Form.o

$(DIR_S)/Math.o: src/Math.c
	gcc $(CPPFLAGS) -c src/Math.c -o $(DIR_S)/Math.o

$(DIR_S)/intersection.o: src/intersection.c
	gcc $(CPPFLAGS) -c src/intersection.c -o $(DIR_S)/intersection.o -lm

$(DIR_T)/Main.o: test/Main.c
	gcc $(CPPFLAGS) -I thirdparty -c test/Main.c -o $(DIR_T)/Main.o

$(DIR_T)/test_inter.o: test/test_inter.c
	gcc $(CPPFLAGS) -I thirdparty -I src -c test/test_inter.c -o $(DIR_T)/test_inter.o

$(TEST): $(DIR_T)/test_inter.o $(DIR_T)/Main.o
	gcc $(CPPFLAGS) $(DIR_S)/Form.o $(DIR_S)/intersection.o $(DIR_S)/Math.o  $(DIR_T)/test_inter.o $(DIR_T)/Main.o -o $(TEST) -lm

clean:
	rm -rf $(DIR_S)/*.o
	rm -rf $(DIR_T)/*.o
	rm -rf bin/*

.PHONY: all clean
