#Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD.
sed -e 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/20\3-\2-\1/g' data.csv > out.1

#Use el . para indicar decimales.
sed 's/,/./g' out.1 > out.3

#Reemplace los ; por ,
sed 's/;/,/g' out.3 >out.4

#Elimina la columna 5 (el cero)
sed 's/,0/ /g' out.4 > out.5

# lo que este entre ,, cambielo por \N
sed 's/,,/,\N,/g' out.5 > out.6


#Transforme el archivo para que todos los campos nulos aparezcan como \N.
sed 's/,N,/,\\\N,/g' out.6 > out.7

sed 's/,N/,\\\N/g' out.7 > out.8

#cambia letras minúsculas por mayúsculas
sed -e 's/a/A/g' -e 's/c/C/g' out.8 > out.10
#Imprime lo que no tenga \N
grep -v '\N' out.10 > out.11
cat out.11

rm out.*
