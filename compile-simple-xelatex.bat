@echo off
echo =======================================================
echo     COMPILATION AVEC XELATEX (Version simplifiee)
echo =======================================================

echo.
echo 1. Nettoyage des fichiers temporaires...
del /Q *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ilg *.ind *.glo *.gls *.acr *.acn *.ist *.fdb_latexmk *.fls *.synctex.gz *.maf *.mtc* *.ptc *.nlo *.bak *.xdv

echo.
echo 2. Compilation avec XeLaTeX...
echo Utilisation du fichier special main-xelatex.tex

echo.
echo Premiere passe...
xelatex -interaction=nonstopmode main-xelatex.tex

echo.
echo Deuxieme passe...
xelatex -interaction=nonstopmode main-xelatex.tex

echo.
echo =======================================================
echo     VERIFICATION FINALE
echo =======================================================

if exist main-xelatex.pdf (
    echo SUCCES: Le fichier PDF a bien ete genere!
    echo Taille du PDF: 
    for %%I in (main-xelatex.pdf) do @echo %%~zI octets
    
    echo.
    echo Ouverture du PDF...
    start main-xelatex.pdf
    
    echo.
    echo Copie du fichier sous le nom main.pdf...
    copy /y main-xelatex.pdf main.pdf
) else (
    echo ERREUR: Le fichier PDF n'a pas ete genere.
    echo Verifiez les messages d'erreur ci-dessus.
)

pause
