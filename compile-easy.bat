@echo off
echo ===== COMPILATION SIMPLIFIEE AVEC GLOSSARIES-EXTRA =====
echo.
echo Etape 1: Premiere compilation LaTeX
pdflatex -interaction=nonstopmode main.tex
echo.

echo Etape 2: Compilation de la bibliographie
bibtex main
echo.

echo Etape 3: Deuxieme compilation LaTeX
pdflatex -interaction=nonstopmode main.tex
echo.

echo Etape 4: Troisieme compilation LaTeX pour finaliser les references
pdflatex -interaction=nonstopmode main.tex
echo.

echo COMPILATION TERMINEE!
echo Le document PDF est disponible: main.pdf
pause