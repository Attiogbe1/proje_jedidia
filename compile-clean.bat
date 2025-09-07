@echo off
echo =====================================================
echo     COMPILATION XELATEX SIMPLIFIEE (ROBOTO FONT)
echo =====================================================

echo.
echo 1. Nettoyage des fichiers temporaires...
del /Q *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ilg *.ind *.glo *.gls *.acr *.acn *.ist *.fdb_latexmk *.fls *.synctex.gz *.maf *.mtc* *.ptc *.nlo *.xdv

echo.
echo 2. Verification que les polices existent...
if not exist "fonts\Roboto-Regular.ttf" (
    echo ERREUR: Police Roboto-Regular.ttf manquante!
    echo Verifiez que les polices sont presentes dans le dossier fonts.
    pause
    exit /b 1
)

echo.
echo 3. Compilation directe avec xelatex...
echo Premier passage...
xelatex -no-pdf -interaction=nonstopmode main-fixed.tex

echo.
echo Deuxieme passage...
xelatex -interaction=nonstopmode main-fixed.tex

echo.
echo =====================================================
echo     VERIFICATION
echo =====================================================

if exist main-fixed.pdf (
    echo SUCCES: PDF genere avec succes!
    echo Taille du PDF:
    for %%I in (main-fixed.pdf) do echo %%~zI octets
    
    echo.
    echo Ouverture du PDF...
    start main-fixed.pdf
) else (
    echo ERREUR: La compilation a echoue.
    echo Verifiez les messages d'erreur dans main-fixed.log
)

pause
