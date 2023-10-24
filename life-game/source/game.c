#include "game.h"
#include "color.h"
#include "graphics_methods.h"

void copyCellField(CellField* source, CellField* dest) {
    for (int i = 0; i < FIELD_WIDTH; i++)
        for (int j = 0; j < FIELD_HEIGHT; j++)
            dest->stash[i * FIELD_WIDTH + j] = source->stash[i * FIELD_WIDTH + j];
}

int updateCellField(CellField* field) {
    CellField temporary;
    copyCellField(field, &temporary);
    int count_unchanged = 0;

    for (int i = 0; i < FIELD_WIDTH; i++)
        for (int j = 0; j < FIELD_HEIGHT; j++) {
            int count = 0;

            for (int k = -1; k <= 1; k++)
                for (int m = -1; m <= 1; m++) {
                    if (k == 0 && m == 0)
                        continue;

                    int near_i = (i + k) % FIELD_WIDTH;
                    if (near_i < 0) near_i += FIELD_WIDTH;
                    int near_j = (j + m) % FIELD_HEIGHT;
                    if (near_j < 0) near_j += FIELD_HEIGHT;

                    if (field->stash[near_i * FIELD_WIDTH + near_j] == 1)
                        count++;
                }

            if ((field->stash[i * FIELD_WIDTH + j] == 1) && (count < 2 || count > 3))
                temporary.stash[i * FIELD_WIDTH + j] = 0;
            else if ((field->stash[i * FIELD_WIDTH + j] == 0) && (count == 3))
                temporary.stash[i * FIELD_WIDTH + j] = 1;
            else
                count_unchanged++;
        }

    if (count_unchanged == FIELD_WIDTH * FIELD_HEIGHT)
        return 0;
    else
        copyCellField(&temporary, field);
        return 1;
}

void drawCellField(CellField* field) {
    SDL_GREEN(cellColor, 255);

    for (int i = 0; i < FIELD_WIDTH; i++)
        for (int j = 0; j < FIELD_HEIGHT; j++)
            if (field->stash[i * FIELD_WIDTH + j] == 1)
                addPixel (i, j, cellColor);
}

void gameCycle() {
    createWindow(FIELD_WIDTH, FIELD_HEIGHT, "LIFE GAME");

    CellField field;
    randomFillCellField(&field);

    while (isOpenWindow()) {
        SDL_BLACK(black_color, 255);
        colorWindow(black_color);

        if (updateCellField(&field) == 0)
            break;

        drawCellField(&field);
        displayWindow();

        #ifdef ONECYCLE
        break;
        #endif
    }

    destroyWindow();
}
