#!/bin/sh

# Script de compilation propre pour LaTeX avec XeLaTeX
# Ce script effacera d'abord tous les fichiers temporaires puis compilera avec XeLaTeX

# 1. Nettoyage des fichiers temporaires
echo "Nettoyage des fichiers temporaires..."
rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ilg *.ind *.glo *.gls *.acr *.acn *.ist *.fdb_latexmk *.fls *.synctex.gz *.maf *.mtc* *.ptc *.nlo

# 2. Compilation avec XeLaTeX (sans latexmk)
echo "Compilation avec XeLaTeX (première passe)..."
xelatex -no-pdf -interaction=nonstopmode -shell-escape main-fixed.tex

echo "Compilation avec XeLaTeX (deuxième passe)..."
xelatex -no-pdf -interaction=nonstopmode -shell-escape main-fixed.tex

echo "Compilation avec XeLaTeX (passe finale avec PDF)..."
xelatex -interaction=nonstopmode -shell-escape main-fixed.tex

# 3. Vérification du résultat
if [ -f main-fixed.pdf ]; then
    echo "Compilation réussie ! Le fichier main-fixed.pdf a été créé."
    # Ouvrir le PDF (selon le système d'exploitation)
    if command -v xdg-open >/dev/null 2>&1; then
        xdg-open main-fixed.pdf
    elif command -v open >/dev/null 2>&1; then
        open main-fixed.pdf
    else
        echo "PDF créé, mais impossible de l'ouvrir automatiquement."
    fi
else
    echo "Erreur: La compilation a échoué. Vérifiez les messages d'erreur."
fi
