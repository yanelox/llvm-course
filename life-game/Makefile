CC=clang
CXX=clang++
CFLAGS=-O2 `sdl2-config --libs --cflags` -o

SOURCE=source/main.c source/graphics.c source/game.c source/random_fill.c
EXEC=life-game

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
	$(CC) -flegacy-pass-manager -Xclang -load -Xclang ./libPass.so $(SOURCE) $(CFLAGS) $(EXEC) > $(EXEC_PATH)

clean:
	rm -rf $(EXEC) $(PASS_O) $(PASS_SO)
