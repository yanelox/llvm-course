#include "graphics.h"
#include <stdio.h>
// Window

Window* createWindow (size_t size, const char* title) {
    Window* newWindow = calloc (1, sizeof (Window));
    if (newWindow == NULL)
        return NULL;

    sfVideoMode mode = {
        .width = size,
        .height = size,
        .bitsPerPixel = 32
    };

    const char default_title[] = "SFML window";
    if (title == NULL)
        title = default_title;

    sfUint32 style = sfClose;

    newWindow->size = size;
    newWindow->sfmlWindow = sfRenderWindow_create (mode, title, style, NULL);
    if (newWindow->sfmlWindow == NULL)
    {
        free(newWindow);
        return NULL;
    }

    return newWindow;
}

void destroyWindow (Window* window) {
    sfRenderWindow_destroy (window->sfmlWindow);
    free(window);
}

void closeWindow (Window* window) {
    sfRenderWindow_close (window->sfmlWindow);
}

void displayWindow (Window* window) {
    sfRenderWindow_display (window->sfmlWindow);
}

void drawRectangleOnWindow (Window* window, sfRectangleShape* rect) {
    sfRenderWindow_drawRectangleShape (window->sfmlWindow, rect, NULL);
}

void colorWindow (Window* window, sfColor color) {
    sfRenderWindow_clear (window->sfmlWindow, color);
}

sfBool Window_IsOpen (Window* window) {
    return sfRenderWindow_isOpen(window->sfmlWindow);
}

sfBool pollEventWindow (Window* window, sfEvent* event) {
    return sfRenderWindow_pollEvent (window->sfmlWindow, event);
}

void addPixel (Window* window, int x, int y, sfColor color) {
    sfVector2f rect_position = {
        .x = x,
        .y = y,
    };

    sfVector2f rect_size = {
        .x = 1.0,
        .y = 1.0,
    };

    sfRectangleShape* rect = sfRectangleShape_create ();
    sfRectangleShape_setPosition (rect, rect_position);
    sfRectangleShape_setFillColor (rect, color);
    sfRectangleShape_setSize (rect, rect_size);

    sfRenderWindow_drawRectangleShape (window->sfmlWindow, rect, NULL);

    sfRectangleShape_destroy(rect);
}
