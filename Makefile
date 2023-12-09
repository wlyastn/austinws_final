CC = g++                    
CFLAGS = --std=c++17        
EXE = fib                   
SRC = ./src                 
INC = ./inc                 
OBJ = ./obj                 
DEBUG = ./debug.log         

# Targets

# 'all' target depends on 'clean', 'obj', 'fib.o', and 'main.o' targets/files/directories
# It compiles and links the source files into the 'fib' executable
all: clean obj $(EXE)

$(EXE): $(OBJ)/main.o $(OBJ)/fib.o
	$(CC) $(CFLAGS) -o $@ $^

# 'main.o' target depends on 'obj', 'main.h', and 'main.cpp'
# It compiles 'main.cpp' into 'main.o'
main.o: $(OBJ) $(INC)/main.h $(SRC)/main.cpp
	$(CC) $(CFLAGS) -c $(SRC)/main.cpp -o $(OBJ)/main.o

# 'fib.o' target depends on 'obj', 'fib.h', and 'fib.cpp'
# It compiles 'fib.cpp' into 'fib.o'
fib.o: $(OBJ) $(INC)/fib.h $(SRC)/fib.cpp
	$(CC) $(CFLAGS) -c $(SRC)/fib.cpp -o $(OBJ)/fib.o

# 'obj' target creates the 'obj' directory if it doesn't exist
obj:
	mkdir -p $(OBJ)

# 'submit' target runs the 'a submit.sh' script
submit:
	./a submit.sh

# 'extract' target runs the 'b extract.sh' script
extract:
	./b extract.sh

# 'test' target runs the executable by running './$(EXE)'
test: $(EXE)
	./$(EXE)

# 'clean' target recursively and forcibly deletes files/directories associated with 'EXE', 'OBJ', and 'DEBUG'
clean:
	rm -rf $(EXE) $(OBJ) $(DEBUG)

# 'cleanall' target depends on 'clean' and deletes 'testing', 'submissions', and 'out' directories
cleanall: clean
	rm -rf testing submissions out

