@echo off
echo Compilation du document avec XeLaTeX (nécessaire pour les polices Google)
echo.

rem Première compilation
xelatex main.tex

rem Compilation des références bibliographiques
bibtex main

rem Compilation des glossaires
makeindex -s main.ist -o main.gls main.glo
makeindex -s main.ist -o main.acr main.acn

rem Deux compilations supplémentaires pour résoudre toutes les références
xelatex main.tex
xelatex main.tex

echo.
echo Compilation terminée. Le fichier PDF devrait être disponible.
pause
