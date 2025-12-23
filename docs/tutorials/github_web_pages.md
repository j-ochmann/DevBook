# GitHub Web Pages
1. Vytvoření repozitáře
    - repository name: uzivatelske-jmeno.github.io
    - musí být nastaven jako public (veřejný)
    - zaškrtněte Add a README file 
2. Nahrání obsahu webu
    - index.html (hlavní stránka webu)
    - commit changes pro uložení změn. 
3. Aktivace GitHub Pages
    - záložka Settings v horním menu repozitáře
    - „Pages“ v levém panelu v sekci „Code and automation“
    - v „Build and deployment“ u Source vybrat Deploy from a branch
    - rozevíracím seznamu pod Branch vyberte větev main (nebo master) a složku / (root)
    - klikněte na tlačítko Save. 
4. Zveřejnění webu
    - Po uložení se v horní části sekce „Pages“ objeví lišta s informací o probíhajícím nasazení.
    - Během několika minut (obvykle do 10) se zobrazí potvrzení,
      že web je online, spolu s jeho adresou: uzivatelske-jmeno.github.io. 
## Důležitá omezení:
GitHub Pages podporuje pouze statické weby (HTML, CSS, JavaScript, frameworky jako React nebo Angular).
Nepodporuje serverové jazyky jako PHP, Python (Django/Flask) nebo databáze.

## GitHub Pages můžete vytvářet pomocí Markdown (.md).
   GitHub má v sobě integrovaný generátor Jekyll,
   který tyto soubory automaticky převede na webové stránky.
   
## Zde jsou hlavní způsoby, jak na to:
1. Rychlá metoda přes výběr motivu (nejjednodušší)
Tato cesta nevyžaduje žádné psaní kódu, stačí vám jeden .md soubor:
Vytvořte v repozitáři soubor README.md nebo index.md.
Přejděte do Settings -> Pages.
V sekci „Build and deployment“ klikněte na tlačítko Choose a theme (pokud se nezobrazuje, ujistěte se, že máte jako zdroj nastaveno Deploy from a branch).
Vyberte si vzhled a potvrďte. GitHub automaticky vytvoří soubor _config.yml, který Markdown propojí s vybranou šablonou. 
2. Vlastní struktura s Jekyll
Pokud chcete mít nad webem větší kontrolu, můžete Markdown soubory organizovat sami:
index.md: Stane se hlavní stránkou (index.html).
kontakt.md: Automaticky se převede na adresu uzivatel.github.io/kontakt.html.
Front Matter: Na začátek každého .md souboru můžete přidat metadata (např. název stránky nebo šablonu):
markdown
---
layout: post
title: Moje první stránka
---
Zde už píšete klasický Markdown text...
 
Výhody a omezení v roce 2025:
Automatizace: Kdykoliv upravíte .md soubor a uložíte změny (commit), web se během chvilky sám aktualizuje.
Vzhled: Bez vybraného motivu (Theme) bude web vypadat jako prostý text. Doporučuje se proto v nastavení Pages vždy nějaký motiv zvolit.
Pokročilé nástroje: Pro dokumentace můžete využít i specializované generátory jako mdBook, které rovněž pracují čistě s Markdownem a GitHub je podporuje.
