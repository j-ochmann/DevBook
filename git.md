# Git
## Instalace (Debian)
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
```bash
git commit -m "Počáteční commit projektu"
```
## Vytvoření repozitáře na GitHubu
- Přihlaste se na GitHub a klikněte na 'New repository' (nový repozitář) a pojmenujte ho. 
## Krok 4: Propojení a nahrání na GitHub
Zkopírujte URL vašeho GitHub repozitáře (např. github.com).
Přidejte vzdálený repozitář:
```bash
git remote add origin github.com:uživatel/repozitář.git
```

jindrich@z570:~/Workspace/DevBook$ git push -u origin main

jindrich@z570:~/Workspace/DevBook$ git branch -M main
jindrich@z570:~/Workspace/DevBook$ git push -u origin main


Pushněte (nahrajte) lokální kód na GitHub:
```bash
git push -u origin main # nebo master, záleží na názvu hlavní větve
```
Pokud název větve neodpovídá, může se oběvit chyba:
```bash
error: src refspec main does not match any
error: failed to push some refs to 'github.com:uživatel/repozitář.git'
```
Opravte přejmenováním aktuální věteve master na main:
```bash
git branch -M main
```
Všimněte si varování u commitu.
- Git automaticky nastavil e-mail.
- Pokud chcete, aby se u commitů na GitHubu zobrazovala vaše správná vizitka a profilový obrázek, opravte to:
```bash
git config --global user.name "vaše jméno"
git config --global user.email "vas@email.com"
git commit --amend --reset-author
```
## Krok 5: Nastavení SSH (Doporučeno pro budoucí práce)
Vygenerujte SSH klíč: 
```bash
ssh-keygen -t ed25519 -C "vas_email@example.com".
```
Zkopírujte obsah souboru ~/.ssh/id_ed25519.pub.
Vložte klíč do nastavení GitHub (Settings -> SSH and GPG keys).
Po nastavení SSH můžete používat git@github.com:uzivatel/muj-projekt.git místo HTTPS.
