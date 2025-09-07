@echo off
echo Nettoyage des fichiers temporaires...
del /Q *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ilg *.ind *.glo *.gls *.acr *.acn *.ist *.fdb_latexmk *.fls *.synctex.gz

echo Compilation avec latexmk et XeLaTeX...
latexmk -pdf -xelatex main.tex

echo Compilation terminée!
if %errorlevel% equ 0 (
  echo Le fichier main.pdf a été créé avec succès.
  echo Ouverture du fichier PDF...
  start main.pdf
) else (
  echo La compilation a échoué avec des erreurs. Veuillez vérifier le fichier main.log pour plus de détails.
)
pause
