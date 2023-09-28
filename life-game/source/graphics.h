#include <SFML/Graphics.h>
#include <stdlib.h>

#ifndef graphics
#define graphics

typedef struct Window {
    size_t size;
    sfRenderWindow* sfmlWindow;
} Window;

Window* createWindow (size_t size, const char* title);
void destroyWindow (Window* window);
void closeWindow (Window* window);
void displayWindow (Window* window);
void drawRectangleOnWindow (Window* window, sfRectangleShape* rect);
void colorWindow (Window* window, sfColor color);
sfBool Window_IsOpen (Window* window);
sfBool pollEventWindow (Window* window, sfEvent* event);
void addPixel (Window* window, int x, int y, sfColor color);

#endif
