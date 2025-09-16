@echo off
echo ===== COMPILATION AVEC GLOSSAIRE (ALTERNATIVE) =====
echo.
echo Etape 1: Premiere compilation LaTeX
pdflatex -interaction=nonstopmode main.tex
echo.

echo Etape 2: Traitement des glossaires avec texindy
texindy -L french -o main.acr main.acn
echo.

echo Etape 3: Compilation de la bibliographie
bibtex main
echo.

echo Etape 4: Deuxieme compilation LaTeX
pdflatex -interaction=nonstopmode main.tex
echo.

echo Etape 5: Troisieme compilation LaTeX pour finaliser les references
pdflatex -interaction=nonstopmode main.tex
echo.

echo COMPILATION TERMINEE!
echo Le document PDF est disponible: main.pdf
pause