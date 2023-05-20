 #/usr/bin/zsh
 cat PC.csv | sed '1d' | jq -R -s -f conv.jq