#ifndef colors
#define colors

typedef struct {
    unsigned red;
    unsigned green;
    unsigned blue;
    unsigned alpha;
} Color;

#define SDL_BLACK(name, x) Color name = {.red = 0, .green = 0, .blue = 0, .alpha = x};
#define SDL_GREEN(name, x) Color name = {.red = 0, .green = 255, .blue = 0, .alpha = x};

#endif