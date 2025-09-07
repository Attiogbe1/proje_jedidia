@echo off
echo Compilation avec pdfLaTeX...

REM Nettoyage des fichiers temporaires
del *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ilg *.ind *.acr *.acn *.alg *.glg *.glo *.gls *.fls *.fdb_latexmk 2>nul

REM Compilation simple en une passe
pdflatex -interaction=nonstopmode main-pdflatex.tex

REM Vérification des erreurs
if errorlevel 1 (
  echo Erreur lors de la compilation. Voir le fichier log pour les détails.
) else (
  echo Compilation terminée avec succès.
  echo Le fichier main-pdflatex.pdf a été généré.
)

pause
