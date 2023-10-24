#ifndef game
#define game

#define FIELD_WIDTH 600
#define FIELD_HEIGHT 600

typedef struct{
    int stash[FIELD_WIDTH * FIELD_HEIGHT];
} CellField;

void destroyCellField(CellField* field);
void randomFillCellField(CellField* field);
int updateCellField(CellField* field);
void drawCellField(CellField* field);

void gameCycle(int n);

#endif
