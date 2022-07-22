#!/usr/bin/env perl
# tex options
# $lualatex     = 'lualatex -shell-escape -synctex=1 -interaction=nonstopmode';
# $pdflualatex  = $lualatex;
# $biber        = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
# $bibtex       = 'bibtex %O %B';
# $makeindex    = 'mendex %O -o %D %S';
# $max_repeat   = 5;
# $pdf_mode     = 4;

$latex            = 'platex -synctex=1 -halt-on-error';
$latex_silent     = 'platex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex           = 'pbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 100;
$pdf_mode         = 3; # 0: none, 1: pdflatex, 2: ps2pdf, 3: dvipdfmx


# preview
$pvc_view_file_via_temporary = 6;
## output directory
#$aux_dir          = "build/";
#$out_dir          = "build/";
