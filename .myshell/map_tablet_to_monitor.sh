#!/bin/bash

# "Wacom Intuos PT S 2 Pen"
TABLET_ID=$(xinput --list | grep -Po "Wacom.+Pen.+id=\K\d{1,3}(?=.+pointer)")

MATRIX_FULL="\
1.000000, 0.000000, 0.000000, \
0.000000, 1.000000, 0.000000, \
0.000000, 0.000000, 1.000000"
MATRIX_RIGHT="\
0.500000, 0.000000, 0.500000, \
0.000000, 1.000000, 0.000000, \
0.000000, 0.000000, 1.000000"
MATRIX_LEFT="\
0.500000, 0.000000, 0.000000, \
0.000000, 1.000000, 0.000000, \
0.000000, 0.000000, 1.000000"

function get_active_matrix {
  local param_matrix="Coordinate Transformation Matrix \(\d{1,3}\):\t\K.+"
  xinput list-props "$TABLET_ID" | grep -Po "$param_matrix"
}

function set_active_matrix {
  local param_matrix="Coordinate Transformation Matrix"
  xinput set-prop "$TABLET_ID" "$param_matrix" $1
}

active_matrix=$(get_active_matrix)
if   [ "$1" == "right" -a "$active_matrix" != "$MATRIX_RIGHT" ]; then
  set_active_matrix "$MATRIX_RIGHT"
elif [ "$1" == "left" -a "$active_matrix" != "$MATRIX_LEFT" ]; then
  set_active_matrix "$MATRIX_LEFT"
else
  set_active_matrix "$MATRIX_FULL"
fi

