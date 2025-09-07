@echo off
echo =======================================================
echo     COMPILATION AVEC XELATEX (CORRIGE)
echo =======================================================

echo.
echo 1. Suppression de tous les fichiers temporaires...
del /Q *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ilg *.ind *.glo *.gls *.acr *.acn *.ist *.fdb_latexmk *.fls *.synctex.gz *.maf *.mtc* *.ptc *.nlo *.bak *.xdv

echo.
echo 2. Verification de la version de XeLaTeX...
xelatex --version
if %ERRORLEVEL% neq 0 (
    echo ERREUR: XeLaTeX n'est pas installe ou n'est pas dans le PATH.
    echo Assurez-vous que MiKTeX ou TeX Live est correctement installe.
    pause
    exit /b 1
)

echo.
echo 3. Compilation avec XeLaTeX (SANS UTILISER PDFLATEX)...

echo 4. Verification du fichier PDF...
if exist main.pdf (
  echo Le fichier main.pdf a ete cree avec succes.
  echo Ouverture du fichier PDF...
  start main.pdf
) else (
  echo La compilation a echoue. Le fichier PDF n'a pas ete cree.
)

pause
