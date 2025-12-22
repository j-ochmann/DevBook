# Git
## Instalace v Debianu
```bash
sudo apt update
sudo apt install git
```
## Vytvoření lokálního repozitáře
Přejděte do adresáře vašeho projektu:
```bash
cd /cesta/k/vasemu/projektu
```
Inicializujte Git v projektu:
```bash
git init
```
Přidejte všechny soubory do "staging" oblasti:
```bash
git add .
```
Udělejte první commit:
bash```
git commit -m "Počáteční commit projektu"
```
## Vytvoření repozitáře na GitHubu
Jděte na GitHub a přihlaste se.
Klikněte na 'New repository' (nový repozitář) a pojmenujte ho. Nezaškrtávejte Initialize this repository with a README.
Po vytvoření uvidíte instrukce pro propojení. 
## Krok 4: Propojení a nahrání na GitHub
Zkopírujte URL vašeho GitHub repozitáře (např. github.com).
Přidejte vzdálený repozitář:
```bash
git remote add origin github.com
```
Pushněte (nahrajte) lokální kód na GitHub:
```bash
git push -u origin main # nebo master, záleží na názvu hlavní větve
 
## Krok 5: Nastavení SSH (Doporučeno pro budoucí práce)
Vygenerujte SSH klíč: 
```bash
ssh-keygen -t ed25519 -C "vas_email@example.com".
```
Zkopírujte obsah souboru ~/.ssh/id_ed25519.pub.
Vložte klíč do nastavení GitHub (Settings -> SSH and GPG keys).
Po nastavení SSH můžete používat git@github.com:uzivatel/muj-projekt.git místo HTTPS.
