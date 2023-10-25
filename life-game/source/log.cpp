#include <stdio.h>
#include <map>
#include <iostream>

static std::map <uint64_t, unsigned> storage;
static std::map <std::string, uint64_t> opcodes;

extern "C" {
    void Logger(char* instruction, uint64_t instrOpcode) {
        std::string instr{instruction};
        storage[instrOpcode]++;
        opcodes[instr] = instrOpcode;
        std::cout << instrOpcode << std::endl;
    }

    void Dump() {
        std::cout << "OPCODES_COUNT\n";

        for (auto i: storage)
            std::cout << i.first << " " << i.second << std::endl;

        std::cout << "OPCODES\n";

        for (auto op: opcodes)
            std::cout << op.first << " " << op.second << std::endl;
    }
}
