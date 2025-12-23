#include <stdio.h>
#include "tangle.h"

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Pouziti: %s <soubor.md> [vystupni_slozka]\n", argv[0]);
        return 1;
    }

    const char *src = argv[1];
    const char *out = (argc > 2) ? argv[2] : "examples";

    printf("Extrahuji z %s do slozky %s...\n", src, out);
    
    if (tangle_extract(src, out) == 0) {
        printf("Hotovo!\n");
    } else {
        perror("Chyba pri extrakci");
    }

    return 0;
}
