#include <stdio.h>
#include <map>
#include <iostream>

static std::map <std::string, int> storage;

extern "C" {
    void Logger(char* instruction) {
        std::string instr{instruction};
        storage[instr]++;
        // printf("[%s] %s\n", funcName, instruction);
    }

    void Dump() {
        for (auto i: storage) {
            std::cout << i.first << ":" << i.second << std::endl;
        }
    }
}
