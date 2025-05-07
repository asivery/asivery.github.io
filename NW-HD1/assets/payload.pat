#pragma endian big
#include <std/core.pat>

struct UpdateRow {
    char name[4];
    u32 offsetStart;
    u32 length;
    u32 mmapRegionStart; // Unused in earlier machines
};

struct Payload {
    u8 data[metadata[std::core::array_index()].length];
}[[name(metadata[std::core::array_index()].name)]];


UpdateRow metadata[7]@$;

u8 validCount = 0;
for(u8 i = 0, i < 7, i = i + 1) {
    if(metadata[i].name[0] == 0) {
        validCount = i;
        break;
    }
}
Payload updatePayloadSections[validCount]@$;
