#include <SDL2/SDL.h>
#include <stdlib.h>

#ifndef graphics
#define graphics

typedef struct {
    Uint8 red;
    Uint8 green;
    Uint8 blue;
    Uint8 alpha;
} Color;

#define SDL_BLACK(name, x) Color name = {.red = 0, .green = 0, .blue = 0, .alpha = x};
#define SDL_GREEN(name, x) Color name = {.red = 0, .green = 255, .blue = 0, .alpha = x};

typedef struct {
    size_t size;
    SDL_Window* sdlWindow;
    SDL_Renderer* sdlRenderer;
    int is_open;
} Window;

Window* createWindow(size_t size, const char* title);
void destroyWindow(Window* window);
void displayWindow(Window* window);
void colorWindow(Window* window, Color color);
void addPixel(Window* window, int x, int y, Color color);

#endif
