@echo off
echo =======================================================
echo    COMPILATION DU MEMOIRE DE SOUTENANCE
echo =======================================================
echo.

echo 1. Nettoyage des fichiers temporaires...
del /Q *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ilg *.ind *.glo *.gls *.acr *.acn *.ist *.fdb_latexmk *.fls *.synctex.gz *.maf *.mtc* *.ptc *.nlo *.bak *.xdv

echo.
echo 2. Premiere compilation...
pdflatex -interaction=nonstopmode main.tex
if %ERRORLEVEL% neq 0 (
    echo ATTENTION: Des erreurs sont survenues mais on continue...
)

echo.
echo 3. Compilation des references bibliographiques...
bibtex main
if %ERRORLEVEL% neq 0 (
    echo ATTENTION: Des problemes avec BibTeX, mais on continue...
)

echo.
echo 4. Compilation des glossaires...
makeindex -s main.ist -o main.gls main.glo
makeindex -s main.ist -o main.acr main.acn

echo.
echo 5. Deuxieme compilation...
pdflatex -interaction=nonstopmode main.tex

echo.
echo 6. Troisieme compilation (finale)...
pdflatex -interaction=nonstopmode main.tex

echo.
echo =======================================================
echo    VERIFICATION FINALE
echo =======================================================

if exist main.pdf (
    echo SUCCES: Le fichier PDF a bien ete genere!
    echo Taille du PDF: 
    for %%I in (main.pdf) do @echo %%~zI octets
    
    echo.
    echo Ouverture du PDF...
    start main.pdf
) else (
    echo ERREUR: Le fichier PDF n'a pas ete genere.
    echo Verifiez les messages d'erreur ci-dessus.
)

pause