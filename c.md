# Technické a ASCII varianty
Pokud pracujete v čistě terminálovém prostředí bez podpory plnohodnotných ikon, využívají se standardní ASCII znaky nebo jejich kombinace:
[i] – Informace.
?> – Nápověda/dotaz.
# – Odkaz na sekci.

## Ikony
kniha:
- 📕 červená (U+1F4D5)
- 📗 zelená (U+1F4D7)
- 📘 modrá (U+1F4D8)
- 📙 oranžová (U+1F4D9)
- 📖 otevřená (U+1F4D6)
- 🕮 dekorativní (U+1F56E)
- 📚 stoh (U+1F4DA)
- 📓 zápisník (U+1F4D3)
- 📒 kroužkový blok (U+1F4D2)
- 🔖 záložka (U+1F516)

# C Tahák

## 1️⃣ Nainstaluj C kompilátor (gcc)

Otevři terminál a zadej:
```bash
sudo apt update
sudo apt install build-essential
```
Balík build-essential obsahuje:
- gcc (C kompilátor)
- make
- základní knihovny a hlavičky
Ověření:
```bash
gcc --version
```
## 2️⃣ Vytvoř zdrojový soubor
Např. soubor hello.c:
```bash
nano hello.c
```
Do něj napiš:
```c
#include <stdio.h>

int main(void) {
    printf("Hello, world!\n");
    return 0;
}
```
Ulož:
- Ctrl + O
- Enter
- Ctrl + X
## 3️⃣ Přelož program
V tom samém adresáři spusť:
```bash
gcc hello.c -o hello
```
Co se stalo:
- hello.c → zdroják
- -o hello → výsledný spustitelný soubor hello
Zkontroluj:
```bash
ls
```
Měl by tam být soubor hello

4️⃣ Spusť program
./hello


Výstup:

Hello, world!

5️⃣ (Volitelné) Překlad s varováními – doporučeno

Pro správné návyky:

gcc -Wall -Wextra -Werror hello.c -o hello


To tě donutí psát čistý a bezpečný C kód.

6️⃣ Co je dobré vědět hned od začátku

main vždy vrací int

return 0; = program skončil OK

stdio.h je standardní knihovna pro vstup/výstup

./ říká shellu „spusť soubor z aktuálního adresáře“
