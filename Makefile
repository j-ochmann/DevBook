# --- KONFIGURACE CEST ---
SRC_DIR = src
EXT_DIR = external/md4c
OUT_DIR = examples
DOC_DIR = docs/examples_src

# --- NASTAVENÍ KOMPILÁTORU ---
CC = gcc
CFLAGS = -Wall -Wextra -O2 -I$(SRC_DIR) -I$(EXT_DIR)
TARGET = tangle

# Volba implementace: simple | md4c
MODE ?= simple

# --- LOGIKA ZDROJOVÝCH SOUBORŮ ---
# Definujeme pouze názvy souborů bez cest
ifeq ($(MODE), md4c)
    COMMON_SRCS = main.c tangle_md4c.c
    EXT_SRCS = $(EXT_DIR)/md4c.c
    CFLAGS += -DUSE_MD4C
else
    COMMON_SRCS = main.c tangle_simple.c
    EXT_SRCS = 
endif

# Automaticky přidáme prefix src/ k vlastním souborům
SRCS = $(addprefix $(SRC_DIR)/, $(COMMON_SRCS)) $(EXT_SRCS)
OBJS = $(SRCS:.c=.o)

# --- DETEKCE PŘÍKLADŮ V MARKDOWNU ---
SOURCE_MD = $(DOC_DIR)/c.md
RAW_C := $(shell [ -f $(SOURCE_MD) ] && sed -n '/^```.*{file=/ s/.*{file=\([^}]*\)}.*/\1/p' $(SOURCE_MD))
GEN_EXAMPLES = $(addprefix $(OUT_DIR)/, $(RAW_C))
EXAMPLE_BINS = $(GEN_EXAMPLES:.c=)

# --- HLAVNÍ PRAVIDLA ---

all: $(TARGET) examples

# Sestavení tangleru
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# Kompilace .c souborů na .o (univerzální pravidlo pro src i external)
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Spuštění extrakce
$(GEN_EXAMPLES): $(SOURCE_MD) $(TARGET)
	@mkdir -p $(OUT_DIR)
	./$(TARGET) $(SOURCE_MD) $(OUT_DIR)

# Kompilace vygenerovaných příkladů
examples: $(GEN_EXAMPLES) $(EXAMPLE_BINS)

$(OUT_DIR)/%: $(OUT_DIR)/%.c
	@# Při kompilaci příkladů přidáme include na MD4C, kdyby ho potřebovaly
	$(CC) $(CFLAGS) -I$(EXT_DIR) -o $@ $< $(EXT_SRCS)

# Úklid
clean:
	rm -f $(SRC_DIR)/*.o $(EXT_DIR)/*.o $(TARGET)
	rm -rf $(OUT_DIR)

# Diagnostika pro kontrolu cest
info:
	@echo "Režim:         $(MODE)"
	@echo "Zdrojáky:      $(SRCS)"
	@echo "Objekty:       $(OBJS)"
	@echo "Markdown:      $(SOURCE_MD)"
	@echo "Cílová složka: $(OUT_DIR)"

.PHONY: all clean info examples
