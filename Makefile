SOURCE_MD = c.md
TANGLER = ./tangle
OUT_DIR = examples

# RAW URL adresy, které GitHub používá pro přímý přístup ke kódu
MD4C_H_URL = raw.githubusercontent.com
MD4C_C_URL = raw.githubusercontent.com

RAW_C := $(shell sed -n '/^```.*{file=/ s/.*{file=\([^}]*\)}.*/\1/p' $(SOURCE_MD))
GENERATED_C = $(addprefix $(OUT_DIR)/, $(RAW_C))
TARGETS = $(GENERATED_C:.c=)

all: $(TARGETS)

# Stažení s hlavičkou User-Agent, aby GitHub neposílal HTML
md4c.h:
	@echo "Stahuji md4c.h..."
	curl -L -H "User-Agent: Mozilla/5.0" $(MD4C_H_URL) -o md4c.h
	@if grep -q "<!DOCTYPE html" md4c.h; then echo "Chyba: Stahlo se HTML misto kodu!"; rm md4c.h; exit 1; fi

md4c.c:
	@echo "Stahuji md4c.c..."
	curl -L -H "User-Agent: Mozilla/5.0" $(MD4C_C_URL) -o md4c.c
	@if grep -q "<!DOCTYPE html" md4c.c; then echo "Chyba: Stahlo se HTML misto kodu!"; rm md4c.c; exit 1; fi

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

