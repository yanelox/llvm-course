#include "graphics.h"
#include <stdio.h>
// Window

Window* createWindow(size_t width, size_t height, const char* title) {
    Window* newWindow = calloc (1, sizeof (Window));
    if (newWindow == NULL)
        return NULL;

    const char default_title[] = "SDL window";
    if (title == NULL)
        title = default_title;

    newWindow->width = width;
    newWindow->height = height;
    newWindow->is_open = 1;
    newWindow->sdlWindow = SDL_CreateWindow(title,
                                            SDL_WINDOWPOS_CENTERED,
                                            SDL_WINDOWPOS_CENTERED,
                                            width, height,
                                            0);
    if (newWindow->sdlWindow == NULL)
        goto destroy_window;

    newWindow->sdlRenderer = SDL_CreateRenderer(newWindow->sdlWindow, -1, 0);
    if (newWindow->sdlWindow == NULL)
        goto destroy_sdl_window;

    return newWindow;

    destroy_sdl_window:
        SDL_DestroyWindow(newWindow->sdlWindow);
    destroy_window:
        free(newWindow);

    return NULL;
}

void destroyWindow(Window* window) {
    SDL_DestroyRenderer(window->sdlRenderer);
    SDL_DestroyWindow(window->sdlWindow);
    free(window);
}

void displayWindow(Window* window) {
    SDL_RenderPresent(window->sdlRenderer);
}

void colorWindow(Window* window, Color color) {
    SDL_SetRenderDrawColor(window->sdlRenderer, color.red, color.green, color.blue, color.alpha);
    SDL_RenderClear(window->sdlRenderer);
}

void addPixel(Window* window, int x, int y, Color color) {
    SDL_SetRenderDrawColor(window->sdlRenderer, color.red, color.green, color.blue, color.alpha);
    SDL_RenderDrawPoint(window->sdlRenderer, x, y);
}
