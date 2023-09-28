#include "game.h"
#include <stdlib.h>

CellField* createCellField (size_t size) {
    CellField* newCellField = calloc (1, sizeof(CellField));
    if (newCellField == NULL)
        return NULL;

    newCellField->size = size;
    newCellField->stash = calloc (size * size, sizeof(int));
    if (newCellField->stash == NULL) {
        free(newCellField);
        return NULL;
    }

    return newCellField;
}

void destroyCellField (CellField* field) {
    free(field->stash);
    free(field);
}

void randomFillCellField (CellField* field) {
    for (int i = 0; i < field->size; i++)
        for (int j = 0; j < field->size; j++)
            field->stash[i * field->size + j] = (rand() > RAND_MAX / 15) ? 0 : 1;
};

int updateCellField (CellField* field) {
    int count_unchanged = 0;

    for (int i = 0; i < field->size; i++)
        for (int j = 0; j < field->size; j++) {
            int count = 0;

            for (int k = -1; k <= 1; k++)
                for (int m = -1; m <= 1; m++) {
                    if (k == 0 && m == 0)
                        continue;

                    int near_i = (i + k) % field->size;
                    int near_j = (j + m) % field->size;

                    if (field->stash[near_i * field->size + near_j] == 1)
                        count++;
                }

            if ((field->stash[i * field->size + j] == 1) && (count < 2 || count > 3))
                field->stash[i * field->size + j] = 0;
            else if ((field->stash[i * field->size + j] == 0) && (count == 3))
                field->stash[i * field->size + j] = 1;
            else
                count_unchanged++;
        }

    if (count_unchanged == field->size * field->size)
        return 0;
    else
        return 1;
}

void drawCellField (Window* window, CellField* field) {
    sfColor cellColor = sfGreen;

    for (int i = 0; i < field->size; i++)
        for (int j = 0; j < field->size; j++)
            if (field->stash[i * field->size + j] == 1)
                addPixel (window, i, j, cellColor);
}