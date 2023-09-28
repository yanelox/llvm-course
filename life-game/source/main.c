#include "game.h"
#include <stdio.h>

int main () {
    const char title[] = "LIFE GAME";
    size_t size = 600;

    Window* window = createWindow (size, title);

    CellField* field = createCellField (size);
    randomFillCellField (field);

    while (Window_IsOpen(window))
    {
        sfEvent event;
        while (pollEventWindow(window, &event))
        {
            if (event.type == sfEvtClosed)
                closeWindow(window);
        }

        colorWindow (window, sfBlack);

        if (updateCellField(field) == 0) {
            closeWindow(window);
        }

        drawCellField (window, field);
        displayWindow (window);
    }

    destroyCellField (field);
    destroyWindow (window);

    return 0;
}