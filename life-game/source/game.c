#include "game.h"
#include <stdlib.h>

void randomFillCellField(CellField* field) {
    for (int i = 0; i < FIELD_WIDTH; i++)
        for (int j = 0; j < FIELD_HEIGHT; j++)
            field->stash[i * FIELD_WIDTH + j] = (rand() > RAND_MAX / 5) ? 0 : 1;
};

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

void drawCellField(Window* window, CellField* field) {
    SDL_GREEN(cellColor, 255);

    for (int i = 0; i < FIELD_WIDTH; i++)
        for (int j = 0; j < FIELD_HEIGHT; j++)
            if (field->stash[i * FIELD_WIDTH + j] == 1)
                addPixel (window, i, j, cellColor);
}