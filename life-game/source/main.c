#include "game.h"
#include <stdio.h>

int main () {
    const char title[] = "LIFE GAME";
    size_t size = 600;

    Window* window = createWindow (size, title);

    CellField* field = createCellField (size);
    randomFillCellField (field);

    while (window->is_open) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_WINDOWEVENT && event.window.event == SDL_WINDOWEVENT_CLOSE)
                window->is_open = 0;
        }

        SDL_BLACK(black_color, 255);
        colorWindow(window, black_color);

        if (updateCellField(field) == 0) {
            window->is_open = 0;
        }

        drawCellField (window, field);
        displayWindow (window);
    }

    destroyCellField (field);
    destroyWindow (window);

    SDL_Quit();

    return 0;
}