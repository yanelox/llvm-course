#include "game.h"
#include "color.h"
#include <stdlib.h>

void randomFillCellField(CellField* field) {
    for (int i = 0; i < FIELD_WIDTH; i++)
        for (int j = 0; j < FIELD_HEIGHT; j++)
            field->stash[i * FIELD_WIDTH + j] = (rand() > RAND_MAX / 5) ? 0 : 1;
}
