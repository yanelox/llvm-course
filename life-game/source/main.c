#include "game.h"
#include <stdio.h>

int main () {
    const char title[] = "LIFE GAME";

    Window* window = createWindow (FIELD_WIDTH, FIELD_HEIGHT, title);

    CellField field;
    randomFillCellField (&field);

    while (window->is_open) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_WINDOWEVENT && event.window.event == SDL_WINDOWEVENT_CLOSE)
                window->is_open = 0;
        }

        SDL_BLACK(black_color, 255);
        colorWindow(window, black_color);

        if (updateCellField(&field) == 0) {
            window->is_open = 0;
        }

        drawCellField (window, &field);
        displayWindow (window);
    }

    destroyWindow (window);

    SDL_Quit();

    return 0;
}