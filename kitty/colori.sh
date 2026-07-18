#!/bin/bash
#
# Nome Appz: LINUX UNIVERSAL INSTALLER SOFTWARE
# Autore: JDWorld
# Mail: satanicseries@gmail.com
# File: /lib/colori.sh - Supporto per colori TrueColor (24-bit) in Bash
#
# Supporta: normale (es, green), brillante (es. yellowb), scuro (es. redd), background (bg_normale/scuro/brillante)

# Reset e attributi
reset=$'\e[0m'
bold=$'\e[1m'
dim=$'\e[2m'
underline=$'\e[4m'

# Funzioni TrueColor
fg24() { printf '\033[38;2;%d;%d;%dm' "$1" "$2" "$3"; }
bg24() { printf '\033[48;2;%d;%d;%dm' "$1" "$2" "$3"; }

# Colori base (RGB)
declare -A base_colors=(
    [black]="0 0 0"
    [white]="255 255 255"
    [red]="255 0 0"
    [green]="0 255 0"
    [blue]="0 0 255"
    [yellow]="255 255 0"
    [cyan]="0 255 255"
    [magenta]="255 0 255"
# per aggiungere altri colori vai su toolset.mrw.it
    [orange]="255 165 0"
    [gray]="128 128 128"
    [pink]="255 192 203"
    [purple]="128 0 128"
    [brown]="165 42 42"
    [lime]="50 205 50"
    [turchese]="64 224 208"
)

# Genera varianti: normale, brillante, scuro, background
for color in "${!base_colors[@]}"; do
    read r g b <<< "${base_colors[$color]}"

    # Normale
    eval "${color}=\$(fg24 $r $g $b)"

    # Brillante (aumenta luminosità del 30%)
    br_r=$(( (r + 178) > 255 ? 255 : r + 77 ))
    br_g=$(( (g + 178) > 255 ? 255 : g + 77 ))
    br_b=$(( (b + 178) > 255 ? 255 : b + 77 ))
    eval "${color}b=\$(fg24 $br_r $br_g $br_b)"

    # Scuro (riduce del 50%)
    dk_r=$(( r / 2 ))
    dk_g=$(( g / 2 ))
    dk_b=$(( b / 2 ))
    eval "${color}d=\$(fg24 $dk_r $dk_g $dk_b)"

    # Background
    eval "bg_${color}=\$(bg24 $r $g $b)"
    eval "bg_${color}b=\$(bg24 $br_r $br_g $br_b)"
    eval "bg_${color}d=\$(bg24 $dk_r $dk_g $dk_b)"
done
