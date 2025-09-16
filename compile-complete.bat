@echo off
echo ===== COMPILATION COMPLETE =====
echo.
echo Etape 1: Premiere compilation LaTeX pour generer les fichiers auxiliaires
pdflatex main.tex
echo.

echo Etape 2: Traitement des glossaires (acronymes)
makeglossaries main
echo.

echo Etape 3: Compilation de la bibliographie
bibtex main
echo.

echo Etape 4: Deuxieme compilation LaTeX pour integrer references
pdflatex main.tex
echo.

echo Etape 5: Troisieme compilation LaTeX pour finaliser
pdflatex main.tex
echo.

echo COMPILATION TERMINEE!
echo Le document PDF est disponible: main.pdf
pause