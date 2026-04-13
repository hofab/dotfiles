#!/bin/bash

if [[ -z "$1" ]]
then
  xrdb -q | grep dpi
else
  echo "Xft.dpi: $1" | xrdb -m
fi
