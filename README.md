# DevBook

## Struktura
```text
projekt/
├── docs/                # Hlavní dokumentace projektu
│   ├── tutorials/       # Návody ve formě .md souborů
│   └── examples_src/    # .md soubory, ze kterých generujete kód
├── examples/            # Výsledné vygenerované .c soubory (ukázky)
├── scripts/             # Skripty (Python/Bash), které provádějí generování
├── external/            # MD4C a další knihovny
├── src/             # Váš zdrojový kód (.c, .cpp)
├── include/         # Vaše hlavičkové soubory (.h)
├── external/        # Cizí knihovny (např. md4c)
│   └── md4c/
│       ├── md4c.h
│       └── md4c.c
├── build/           # Výstupy kompilace (ignore v gitu)
└── CMakeLists.txt   # Konfigurace sestavení
```
