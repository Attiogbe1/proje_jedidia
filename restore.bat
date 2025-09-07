@echo off
echo ==============================================
echo SCRIPT DE RESTAURATION
echo ==============================================
echo.

echo Verification du fichier main-fixed.pdf existant...
if exist main-fixed.pdf (
    echo OK - Le fichier main-fixed.pdf existe.
    echo Taille: 
    for %%I in (main-fixed.pdf) do echo %%~zI octets
) else (
    echo ERREUR - Le fichier main-fixed.pdf n'existe pas!
    goto :error
)

echo.
echo Copie du fichier main-fixed.pdf vers main-restored.pdf...
copy main-fixed.pdf main-restored.pdf
if exist main-restored.pdf (
    echo OK - Copie réussie.
) else (
    echo ERREUR - Impossible de créer main-restored.pdf!
    goto :error
)

echo.
echo Copie de tous les fichiers de configuration nécessaires...
if exist main-fixed.tex (
    copy main-fixed.tex main-restored.tex
    echo OK - main-fixed.tex copié vers main-restored.tex
) else (
    echo AVERTISSEMENT - main-fixed.tex n'existe pas, utilisation de main.tex...
    copy main.tex main-restored.tex
)

echo.
echo ==============================================
echo RESTAURATION TERMINEE AVEC SUCCES
echo ==============================================
echo Le document a été restauré avec succès.
echo Vous pouvez maintenant utiliser:
echo   - main-restored.pdf (copie du dernier PDF généré)
echo   - main-restored.tex (copie du dernier fichier source)
echo.
echo Pour voir le PDF restauré, tapez:
echo   start main-restored.pdf
echo.

goto :end

:error
echo.
echo ==============================================
echo ERREUR DE RESTAURATION
echo ==============================================
echo Le processus de restauration a échoué.
echo.

:end
pause
