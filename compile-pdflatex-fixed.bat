@echo off
echo Compilation avec pdfLaTeX...

rem Nettoyer les fichiers temporaires
del *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ilg *.ind *.acr *.acn *.alg *.glg *.glo *.gls *.fls *.fdb_latexmk 2>nul

rem Première compilation
pdflatex -interaction=nonstopmode main-pdflatex.tex
if errorlevel 1 (
  echo Erreur lors de la première compilation. Vérifiez les erreurs.
  pause
  exit /b 1
)

rem Traiter la bibliographie
bibtex main-pdflatex
if errorlevel 1 (
  echo Erreur lors de la compilation BibTeX. Vérifiez les erreurs.
  pause
  exit /b 1
)

rem Traiter les références croisées
pdflatex -interaction=nonstopmode main-pdflatex.tex
pdflatex -interaction=nonstopmode main-pdflatex.tex

echo Compilation terminée avec succès.
echo Le fichier main-pdflatex.pdf a été généré.

pause
