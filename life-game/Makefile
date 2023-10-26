CC=clang
CXX=clang++
CFLAGS=-lstdc++ -O2 `sdl2-config --libs --cflags` -o

SOURCE=source/main.c source/game.c source/random_fill.c
EXEC=life-game

INSTR_PATH=source/log.cpp
INSTR_O=log.o
INSTR_SO=log.so

GRAPHICS_PATH=source/graphics.c
GRAPHICS_O=graphics.o

PASS_SOURCE=source/llvm-pass.cpp
PASS_O=Pass.o
PASS_SO=libPass.so
EXEC_PATH=execution_path.log

all: game

game:
	$(CC) $(SOURCE) $(CFLAGS) $(EXEC)

pass:
	$(CXX) $(PASS_SOURCE) -c -fPIC -I/usr/include/llvm-14 -I/usr/include/llvm-c-14 -o $(PASS_O)
	$(CXX) $(PASS_O) -fPIC -shared -o $(PASS_SO)
	rm -rf $(PASS_O)

game-with-pass: pass
	$(CXX) $(INSTR_PATH) -c -o $(INSTR_O)
	$(CC) $(GRAPHICS_PATH) -c -o $(GRAPHICS_O)
	$(CC) -flegacy-pass-manager -Xclang -load -Xclang ./libPass.so $(INSTR_O) $(GRAPHICS_O) $(SOURCE) $(CFLAGS) $(EXEC)
	rm -rf $(INSTR_O) $(GRAPHICS_O)

game-with-pass-one-cycle: pass
	$(CXX) $(INSTR_PATH) -c -o $(INSTR_O)
	$(CC) $(GRAPHICS_PATH) -c -o $(GRAPHICS_O)
	$(CC) -flegacy-pass-manager -Xclang -load -Xclang ./libPass.so $(INSTR_O) $(GRAPHICS_O) -DONECYCLE $(SOURCE) $(CFLAGS) $(EXEC)
	rm -rf $(INSTR_O) $(GRAPHICS_O)

clean:
	rm -rf $(EXEC) $(PASS_O) $(PASS_SO)
