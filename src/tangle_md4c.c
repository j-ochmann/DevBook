#include "tangle.h"
#include "md4c.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

typedef struct { FILE *f; const char *dir; int active; } Context;

int enter_block(MD_BLOCKTYPE type, void* detail, void* userdata) {
    Context* ctx = (Context*)userdata;
    if(type == MD_BLOCK_CODE) {
        MD_BLOCK_CODE_DETAIL* d = (MD_BLOCK_CODE_DETAIL*)detail;
        char buf[256], path[512];
        size_t len = d->info.size < 255 ? d->info.size : 255;
        memcpy(buf, d->info.text, len); buf[len] = '\0';
        char *f = strstr(buf, "{file=");
        if(f) {
            sscanf(f, "{file=%255[^}]}", buf);
            snprintf(path, sizeof(path), "%s/%s", ctx->dir, buf);
            ctx->f = fopen(path, "w");
            ctx->active = 1;
        }
    }
    return 0;
}

int text_cb(MD_TEXTTYPE type, const MD_CHAR* text, MD_SIZE size, void* userdata) {
    Context* ctx = (Context*)userdata;
    if(ctx->active && ctx->f && type == MD_TEXT_CODE) fwrite(text, 1, size, ctx->f);
    return 0;
}

int leave_block(MD_BLOCKTYPE type, void* detail, void* userdata) {
    Context* ctx = (Context*)userdata;
    if(type == MD_BLOCK_CODE && ctx->f) { fclose(ctx->f); ctx->f = NULL; ctx->active = 0; }
    return 0;
}

int tangle_extract(const char *source_md, const char *out_dir) {
    mkdir(out_dir, 0755);
    FILE* f = fopen(source_md, "rb");
    if(!f) return 1;
    fseek(f, 0, SEEK_END); long s = ftell(f); fseek(f, 0, SEEK_SET);
    char* data = malloc(s); fread(data, 1, s, f); fclose(f);

    Context ctx = {NULL, out_dir, 0};
    MD_PARSER p = {0, MD_DIALECT_COMMONMARK, enter_block, leave_block, NULL, NULL, text_cb, NULL, NULL};
    md_parse(data, s, &p, &ctx);
    free(data);
    return 0;
}
