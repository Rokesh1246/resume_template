#!/bin/bash
# Compiles LaTeX resume files to the pdf/ directory using tectonic / pdflatex

mkdir -p pdf

if [ "$#" -eq 0 ]; then
  echo "Compiling all tailored resumes in temp/ to pdf/..."
  shopt -s nullglob
  for f in temp/*.tex; do
    [ -f "$f" ] || continue
    [ "$f" = "temp/resume_template.tex" ] && continue
    echo "Compiling $f -> pdf/"
    tectonic -o pdf "$f"
  done
  echo "Compiling 1-page resume Rokesh_Govindaraj_Resume_1Page.tex -> pdf/"
  tectonic -o pdf Rokesh_Govindaraj_Resume_1Page.tex
  echo "Compiling master 2-page resume Rokesh_Govindaraj_Resume.tex -> pdf/"
  tectonic -o pdf Rokesh_Govindaraj_Resume.tex
else
  for target in "$@"; do
    echo "Compiling $target -> pdf/"
    tectonic -o pdf "$target"
  done
fi

echo "Compilation complete. Output PDFs in pdf/:"
ls -lh pdf/
