#include "tangle.h"
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>

int tangle_extract(const char *source_md, const char *out_dir) {
    FILE *in = fopen(source_md, "r");
    if (!in) return 1;

    mkdir(out_dir, 0755);
    char line[1024];
    FILE *out = NULL;

    while (fgets(line, sizeof(line), in)) {
        char *file_attr = strstr(line, "{file=");
        if (strncmp(line, "```", 3) == 0 && file_attr) {
            char out_name[256], full_path[512];
            sscanf(file_attr, "{file=%255[^}]}", out_name);
            snprintf(full_path, sizeof(full_path), "%s/%s", out_dir, out_name);
            out = fopen(full_path, "w");
            continue;
        }
        if (out) {
            if (strncmp(line, "```", 3) == 0) { fclose(out); out = NULL; }
            else fputs(line, out);
        }
    }
    fclose(in);
    return 0;
}

