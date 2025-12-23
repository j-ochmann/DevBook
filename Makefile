SOURCE_MD = c.md
TANGLER = ./tangle
OUT_DIR = examples

RAW_C := $(shell sed -n '/^```.*{file=/ s/.*{file=\([^}]*\)}.*/\1/p' $(SOURCE_MD))
GENERATED_C = $(addprefix $(OUT_DIR)/, $(RAW_C))
TARGETS = $(GENERATED_C:.c=)

all: $(TARGETS)

$(OUT_DIR)/%: $(OUT_DIR)/%.c md4c.h md4c.c | $(OUT_DIR)
	@if grep -q "md4c.h" $<; then \
		echo "Kompiluji s MD4C: $@"; \
		$(CC) $(CFLAGS) -I. -o $@ $< md4c.c; \
	else \
		$(CC) $(CFLAGS) -o $@ $<; \
	fi

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

$(GENERATED_C): $(SOURCE_MD) $(TANGLER) | $(OUT_DIR)
	$(TANGLER) $(SOURCE_MD)

$(TANGLER): tangle.c
	$(CC) -o $(TANGLER) tangle.c

clean:
	rm -rf $(OUT_DIR) $(TANGLER) md4c.h md4c.c

.PHONY: all clean
