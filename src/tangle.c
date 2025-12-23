#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/stat.h> // Pro mkdir

void extract_code(const char *filename) {
    FILE *in = fopen(filename, "r");
    if (!in) { perror("Chyba při otevírání"); return; }

    // Vytvoří složku examples, pokud neexistuje (práva 0755)
#ifdef _WIN32
    _mkdir("examples");
#else
    mkdir("examples", 0755);
#endif

    char line[1024];
    FILE *out = NULL;

    while (fgets(line, sizeof(line), in)) {
        char *file_attr = strstr(line, "{file=");
        if (strncmp(line, "```", 3) == 0 && file_attr) {
            char out_name[256];
            char full_path[512];
            
            // Extrakce názvu souboru
            if (sscanf(file_attr, "{file=%255[^}]}", out_name) == 1) {
                // Sestavení cesty: examples/nazev_souboru.c
                snprintf(full_path, sizeof(full_path), "examples/%s", out_name);
                
                out = fopen(full_path, "w");
                if (out) {
                    printf("Generuji soubor: %s\n", full_path);
                } else {
                    perror("Chyba při zápisu souboru");
                }
            }
            continue;
        }

        if (out) {
            if (strncmp(line, "```", 3) == 0) {
                fclose(out);
                out = NULL;
            } else {
                fputs(line, out);
            }
        }
    }
    fclose(in);
}

int main(int argc, char *argv[]) {
    if (argc < 2) { 
        printf("Použití: %s <soubor.md>\n", argv[0]); 
        return 1; 
    }
    extract_code(argv[1]);
    return 0;
}
