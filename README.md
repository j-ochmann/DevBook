# DevBook

## Struktura
```text
projekt/
├── docs/                # dokumentace projektu
│   ├── tutorials/       # návody ve formě .md souborů
│   └── examples_src/    # .md soubory, ze kterých generujete kód
├── examples/            # Vygenerované .c soubory (ukázky)
├── scripts/             # skripty (Python/Bash), které provádějí generování
├── external/            # MD4C a další knihovny
├── src/             # zdrojový kód (.c, .cpp)
├── include/         # hlavičkové soubory (.h)
├── external/        # knihovny třetích stran (např. md4c)
│   └── md4c/
│       ├── md4c.h
│       └── md4c.c
├── build/           # výstupy kompilace (ignore v gitu)
└── CMakeLists.txt   # Konfigurace sestavení
```
