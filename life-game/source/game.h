#include "graphics.h"

#ifndef game
#define game

typedef struct CellField {
    size_t size;

    int* stash;
} CellField;

CellField* createCellField(size_t size);
void destroyCellField(CellField* field);
void randomFillCellField(CellField* field);
int updateCellField(CellField* field);
void drawCellField(Window* window, CellField* field);

#endif