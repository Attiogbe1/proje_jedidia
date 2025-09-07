@echo off
setlocal enabledelayedexpansion

echo =======================================================
echo Solution Complete pour LaTeX avec XeLaTeX (special font)
echo =======================================================
echo.

echo Phase 1: Nettoyage des fichiers auxiliaires...
del /Q *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ilg *.ind *.glo *.gls *.acr *.acn *.ist *.fdb_latexmk *.fls *.synctex.gz *.maf *.mtc* *.ptc *.nlo

echo.
echo Phase 2: Verification de la police Roboto...
if not exist "fonts\Roboto-Regular.ttf" (
    echo ERREUR: Polices Roboto manquantes!
    echo Installation des polices...
    if exist "fonts\roboto.zip" (
        echo Extraction de roboto.zip...
        powershell -command "Expand-Archive -Path 'fonts\roboto.zip' -DestinationPath 'fonts' -Force"
    ) else (
        echo ERREUR: Fichier roboto.zip manquant! 
        echo Veuillez télécharger les polices Roboto et les placer dans le dossier fonts
    )
)

echo.
echo Phase 3: Creation du fichier de configuration XeLaTeX optimisé...
(
echo \$pdflatex = "xelatex -interaction=nonstopmode -shell-escape %%O %%S";
echo \$pdf_mode = 1;
echo \$postscript_mode = \$dvi_mode = 0;
echo \$clean_ext = "aux log out toc lof lot bbl blg idx ilg ind glo gls acr acn ist fdb_latexmk fls synctex.gz maf mtc* ptc nlo";
) > latexmkrc-fixed.txt

echo.
echo Phase 4: Compilation avec XeLaTeX (sans utiliser latexmk)...
echo Premier passage...
xelatex -no-pdf -interaction=nonstopmode -shell-escape main-fixed.tex

echo.
echo Compilation des références bibliographiques...
bibtex main-fixed

echo.
echo Deuxième passage...
xelatex -no-pdf -interaction=nonstopmode -shell-escape main-fixed.tex

echo.
echo Passage final avec génération du PDF...
xelatex -interaction=nonstopmode -shell-escape main-fixed.tex

echo.
echo Phase 5: Vérification du résultat...
if exist main-fixed.pdf (
    echo ==============================================
    echo COMPILATION REUSSIE! 
    echo ==============================================
    echo Le fichier main-fixed.pdf a été créé.
    
    echo.
    echo Ouverture du PDF...
    start main-fixed.pdf
) else (
    echo ECHEC: La compilation a échoué.
    echo Vérifiez les messages d'erreur dans le fichier main-fixed.log
)

echo.
echo Analyse des erreurs et avertissements...
findstr /C:"Error" /C:"! " main-fixed.log
findstr /C:"Warning" /C:"Font" main-fixed.log

echo.
echo =================================================
echo Processus terminé - Vérifiez le PDF généré
echo =================================================

pause
