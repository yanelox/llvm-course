CC=gcc
CFLAGS=`sdl2-config --libs --cflags` -o

SOURCE=source/main.c source/graphics.c source/game.c source/random_fill.c
EXEC=life-game

all:
	$(CC) $(SOURCE) $(CFLAGS) $(EXEC)

clean:
	rm -rf $(EXEC)
