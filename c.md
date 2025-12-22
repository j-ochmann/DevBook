# C Tahák

## 0️⃣ Zkratka
```bash
clear &&
gcc -Wall -Wextra -Werror hello_world.c -o hello_world
&& ./hello_world
```
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
Např. soubor hello_world.c:
```bash
nano hello_world.c
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
gcc hello_world.c -o hello_world
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
```bash
./hello_world
```
Výstup:
```bash
Hello, world!
```
5️⃣ (Volitelné) Překlad s varováními – doporučeno

Pro správné návyky:
```bash
gcc -Wall -Wextra -Werror hello_world.c -o hello_world
```
To tě donutí psát čistý a bezpečný C kód.

6️⃣ Co je dobré vědět hned od začátku
- main vždy vrací int
- return 0; = program skončil OK
- stdio.h je standardní knihovna pro vstup/výstup
- ./ říká shellu „spusť soubor z aktuálního adresáře“
