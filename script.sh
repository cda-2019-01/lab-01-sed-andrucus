
sed -e 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/20\3-\2-\1/g' data.csv > out.1
sed 's/;N/;\\\N/g' out.1 > out.2
sed 's/,/./g' out.2 > out.3
sed 's/;/,/g' out.3 >out.4
sed 's/,0/ /g' out.4 > out.5
sed -e 's/a/A/g' -e 's/c/C/g' out.5 > out.6
sed -n '1,3p; 11p' out.6 >out.7
