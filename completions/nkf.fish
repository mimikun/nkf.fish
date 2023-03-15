complete -c nkf -s V -d "Print the configuration"
complete -c nkf -l help -d "Print the help"
complete -c nkf -s v -l version -d "Print the version"
complete -c nkf -s g -l guess -d "Guess the input code"


# ➜ nkf --help
# Usage:  nkf -[flags] [--] [in file] .. [out file for -O flag]
#  j/s/e/w  Specify output encoding ISO-2022-JP, Shift_JIS, EUC-JP
#           UTF options is -w[8[0],{16,32}[{B,L}[0]]]
#  J/S/E/W  Specify input encoding ISO-2022-JP, Shift_JIS, EUC-JP
#           UTF option is -W[8,[16,32][B,L]]
#  m[BQSN0] MIME decode [B:base64,Q:quoted,S:strict,N:nonstrict,0:no decode]
#  M[BQ]    MIME encode [B:base64 Q:quoted]
#  f/F      Folding: -f60 or -f or -f60-10 (fold margin 10) F preserve nl
#  Z[0-4]   Default/0: Convert JISX0208 Alphabet to ASCII
#           1: Kankaku to one space  2: to two spaces  3: HTML Entity
#           4: JISX0208 Katakana to JISX0201 Katakana
#  X,x      Convert Halfwidth Katakana to Fullwidth or preserve it
#  O        Output to File (DEFAULT 'nkf.out')
#  L[uwm]   Line mode u:LF w:CRLF m:CR (DEFAULT noconversion)
#  --ic=<encoding>        Specify the input encoding
#  --oc=<encoding>        Specify the output encoding
#  --hiragana --katakana  Hiragana/Katakana Conversion
#  --katakana-hiragana    Converts each other
#  --{cap, url}-input     Convert hex after ':' or '%'
#  --numchar-input        Convert Unicode Character Reference
#  --fb-{skip, html, xml, perl, java, subchar}
#                         Specify unassigned character's replacement
#  --in-place[=SUF]       Overwrite original files
#  --overwrite[=SUF]      Preserve timestamp of original files
#  -g --guess             Guess the input code
#  -v --version           Print the version
#  --help/-V              Print this help / configuration
# Network Kanji Filter Version 2.1.5 (2018-12-15) 
# Copyright (C) 1987, FUJITSU LTD. (I.Ichikawa).
# Copyright (C) 1996-2018, The nkf Project.
