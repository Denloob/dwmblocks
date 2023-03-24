#!/bin/bash

printf " "

case $(xkb-switch) in
    "us") printf "EN";;
    "il") printf "HE";;
    "ru") printf "RU";;
esac

