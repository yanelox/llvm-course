#include "graphics.h"
#include "graphics_methods.h"
#include <stdio.h>
// Window

static Window* window;

void createWindow(int width, int height, const char* title) {
    window = calloc (1, sizeof (Window));
    if (window == NULL)
        return;

    const char default_title[] = "SDL window";
    if (title == NULL)
        title = default_title;

    window->width = width;
    window->height = height;
    window->is_open = 1;
    window->sdlWindow = SDL_CreateWindow(title,
                                            SDL_WINDOWPOS_CENTERED,
                                            SDL_WINDOWPOS_CENTERED,
                                            width, height,
                                            0);
    if (window->sdlWindow == NULL)
        goto destroy_window;

    window->sdlRenderer = SDL_CreateRenderer(window->sdlWindow, -1, 0);
    if (window->sdlWindow == NULL)
        goto destroy_sdl_window;

    return;

    destroy_sdl_window:
        SDL_DestroyWindow(window->sdlWindow);
    destroy_window:
        free(window);
}

void destroyWindow() {
    SDL_DestroyRenderer(window->sdlRenderer);
    SDL_DestroyWindow(window->sdlWindow);
    free(window);
    SDL_Quit();
}

void displayWindow() {
    SDL_RenderPresent(window->sdlRenderer);
}

void colorWindow(Color color) {
    SDL_SetRenderDrawColor(window->sdlRenderer, color.red, color.green, color.blue, color.alpha);
    SDL_RenderClear(window->sdlRenderer);
}

void addPixel(int x, int y, Color color) {
    SDL_SetRenderDrawColor(window->sdlRenderer, color.red, color.green, color.blue, color.alpha);
    SDL_RenderDrawPoint(window->sdlRenderer, x, y);
}

int isOpenWindow() {
    SDL_Event event;
    while (SDL_PollEvent(&event)) {
        if (event.type == SDL_WINDOWEVENT && event.window.event == SDL_WINDOWEVENT_CLOSE)
            return 0;
    }

    return 1;
}