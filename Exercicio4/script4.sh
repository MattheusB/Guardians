#!/bin/sh

(strace -T $1 $2 $3 $4 $5 $6 $7 $8 $9) 2 > trace > /dev/null

valor1=0
valor2=0
valor3=0

while read line ; do

    (echo $line | grep ">") > aux

    numero_linhas=$(cat aux | wc -l)

    if [ numero_linhas -gt 0] ; then

        var=$(echo $line | rev | cut -d">" -f2 | cut -c 1-8 | rev)

        if [ $(echo "$var > $valor1" | bc) = 1 ] ; then
            valor1=$var
            line_aux=$line

        fi

    fi

done < trace

echo $line_aux

while read line ; do

    (echo $line | grep ">") > aux

    numero_linhas=$(cat aux | wc -l)

    if [ numero_linhas -gt 0] ; then

        var=$(echo $line | rev | cut -d">" -f2 | cut -c 1-8| rev)

        if [ $(echo "$var > $valor2" | bc) = 1 ] ; then

            if [ $echo "$var < $valor1" | bc = 1 ] ; then

                valor2=$var
                line_aux2=$line
            fi
        fi
    fi
    


done < trace

echo $line_aux2


while read line ; do

    (echo $line | grep ">") > aux

    numero_linhas=$(cat aux | wc -l)

    if [ numero_linhas -gt 0] ; then

        var=$(echo $line | rev | cut -d">" -f2 | cut -c 1-8| rev)

        if [ $(echo "$var > $valor3" | bc) = 1 ] ; then

            if [ $(echo "$var < $valor2" | bc) = 1 ] ; then

                if [ $(echo "$var < $valor1" | bc) = 1 ] ; then
                    valor3=$var
                    line_aux3=$line

                fi
            fi
        fi
    fi

done < trace

echo $line_aux3 
