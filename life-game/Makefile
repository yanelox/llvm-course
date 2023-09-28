CC=gcc
CFLAGS=-lcsfml-graphics -lcsfml-window -lcsfml-system -o

SOURCE=source/main.c source/graphics.c source/game.c
EXEC=life-game

all:
	$(CC) $(SOURCE) $(CFLAGS) $(EXEC)

clean:
	rm -rf $(EXEC)