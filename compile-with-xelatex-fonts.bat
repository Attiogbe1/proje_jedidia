@echo off
echo =====================================================
echo    Compilation XeLaTeX avec Google Fonts
echo =====================================================
echo.

echo 1. Nettoyage des fichiers temporaires...
del /Q *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ilg *.ind *.glo *.gls *.acr *.acn *.ist *.fdb_latexmk *.fls *.synctex.gz *.maf *.mtc* *.ptc *.nlo *.bak

echo.
echo 2. Premiere compilation XeLaTeX...
xelatex -interaction=nonstopmode main-xelatex.tex

echo.
echo 3. Compilation bibliographique...
bibtex main-xelatex

echo.
echo 4. Compilation glossaire...
makeindex -s main-xelatex.ist -o main-xelatex.gls main-xelatex.glo
makeindex -s main-xelatex.ist -o main-xelatex.acr main-xelatex.acn

echo.
echo 5. Deuxieme compilation XeLaTeX...
xelatex -interaction=nonstopmode main-xelatex.tex

echo.
echo 6. Compilation finale XeLaTeX...
xelatex -interaction=nonstopmode main-xelatex.tex

echo.
echo =====================================================
echo    Verification du resultat
echo =====================================================

if exist main-xelatex.pdf (
  echo Succes: Le fichier main-xelatex.pdf a ete cree.
  echo Ouverture du PDF...
  start main-xelatex.pdf
) else (
  echo Erreur: La compilation a echoue.
)

echo.
pause
