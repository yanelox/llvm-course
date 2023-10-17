#include "color.h"

#ifndef graphics_methods
#define graphics_methods

void createWindow (int width, int height, const char* title);
void destroyWindow();
void displayWindow();
void colorWindow(Color color);
void addPixel(int x, int y, Color color);
int isOpenWindow();

#endif