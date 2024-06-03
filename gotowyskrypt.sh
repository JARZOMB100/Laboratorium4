#!/bin/bash

if [[ "$1" == "--data" || "$1" == "-d" ]]; then
    date
elif [[ "$1" == "--logi" || "$1" == "-l" ]]; then
    liczba=${2:-100}
    for ((i=1; i<=liczba; i++)); do
        echo "Nazwa pliku: log$i.txt" > "log$i.txt"
        echo "Nazwa skryptu: $0" >> "log$i.txt"
        date >> "log$i.txt"
    done
elif [[ "$1" == "--pomoc" || "$1" == "-p" ]]; then
    echo "Dostępne opcje:"
    echo "--data, -d : Wyświetl dzisiejszą datę"
    echo "--logi, -l [liczba] : Utwórz [liczba] plików log"
    echo "--pomoc, -p : Wyświetl tę wiadomość pomocy"
    echo "--init : Sklonuj repozytorium do katalogu i ustaw PATH"
    echo "--blad, -b [liczba] : Utwórz [liczba] plików błędu"
elif [[ "$1" == "--init" ]]; then
    git clone https://github.com/JARZOMB100/Laboratorium4.git
    export PATH=$PATH:$(pwd)/NazwaRepozytorium
elif [[ "$1" == "--blad" || "$1" == "-b" ]]; then
    liczba=${2:-100}
    for ((i=1; i<=liczba; i++)); do
        mkdir -p "blad$i"
        echo "Nazwa pliku: blad$i.txt" > "blad$i/blad$i.txt"
        echo "Nazwa skryptu: $0" >> "blad$i/blad$i.txt"
        date >> "blad$i/blad$i.txt"
    done
else
    echo "Nieznana opcja. Użyj --pomoc lub -p, aby wyświetlić dostępne opcje."
fi
