@echo off
echo =====================================================
echo    Compilation du memoire avec XeLaTeX et polices
echo =====================================================
echo.

echo 1. Nettoyage des fichiers temporaires...
del /Q *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ilg *.ind *.glo *.gls *.acr *.acn *.ist *.fdb_latexmk *.fls *.synctex.gz *.maf *.mtc* *.ptc *.nlo *.bak

echo.
echo 2. Premiere compilation XeLaTeX...
xelatex -interaction=nonstopmode main.tex

echo.
echo 3. Compilation bibliographique...
bibtex main

echo.
echo 4. Compilation glossaire...
makeindex -s main.ist -o main.gls main.glo
makeindex -s main.ist -o main.acr main.acn

echo.
echo 5. Deuxieme compilation XeLaTeX...
xelatex -interaction=nonstopmode main.tex

echo.
echo 6. Compilation finale XeLaTeX...
xelatex -interaction=nonstopmode main.tex

echo.
echo =====================================================
echo    Compilation terminee
echo =====================================================

if exist main.pdf (
  echo Succes: Le fichier main.pdf a ete cree.
  echo Ouverture du PDF...
  start main.pdf
) else (
  echo Erreur: La compilation a echoue.
)

echo.
pause
