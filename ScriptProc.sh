#!/bin/bash

echo -e "Name\t\tPID"

# Initialiser le PID avec celui du script en cours
PID=$$

# Boucle jusqu'à atteindre le PID 1 (init/systemd)
while [ "$PID" -ne 1 ]; do
    # Récupérer le nom du processus
    NAME=$(ps -o comm= -p "$PID" 2>/dev/null)

    # Afficher le nom et le PID
    printf "%-15s %d\n" "$NAME" "$PID"

    # Obtenir le PID du parent
    PID=$(ps -o ppid= -p "$PID" 2>/dev/null | tr -d ' ')
done

# Ajouter systemd (ou init)
echo "systemd            1"
