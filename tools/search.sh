#!/usr/bin/env bash
FT="$(echo $1| cut -d'.' -f1)"
firefox "https://duckduckgo.com/?q=${FT}+$2&atb=v132-3_j&ia=qa"
