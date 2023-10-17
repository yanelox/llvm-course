#include <SDL2/SDL.h>
#include <stdlib.h>
#include "color.h"

#ifndef graphics
#define graphics

typedef struct {
    size_t width;
    size_t height;
    SDL_Window* sdlWindow;
    SDL_Renderer* sdlRenderer;
    int is_open;
} Window;

#endif
