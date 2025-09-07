#!/bin/bash

echo "Compilation du document avec XeLaTeX (nécessaire pour les polices Google)"
echo ""

# Première compilation
xelatex main.tex

# Compilation des références bibliographiques
bibtex main

# Compilation des glossaires
makeindex -s main.ist -o main.gls main.glo
makeindex -s main.ist -o main.acr main.acn

# Deux compilations supplémentaires pour résoudre toutes les références
xelatex main.tex
xelatex main.tex

echo ""
echo "Compilation terminée. Le fichier PDF devrait être disponible."
