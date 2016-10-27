#!/bin/bash

if [ $# -le 3 ] ; then

    N=$1
    S=$2
    P_USER=$3

else

#Captura das entradas
echo "Digite o numero de observacoes:"
read N

echo

echo "Digite o intervalo de tempo em segundos:"
read S

echo

echo "Digite o comeco de nome de um usuario:"
read P_USER

echo

fi

#Verificacao dos casos propostos
    if [ -z $N ] ; then
    echo 1
    
    elif [ -z $S ] ; then
    echo 1

    elif [ -z $P_USER ] ; then
    echo 1
    
    elif [ $N -le 0 ] ; then
    echo 1

    elif [ $S -le 0 ] ; then
    echo 1
    
    fi

CPU=0.0
maior_CPU=0.0

MEM=0.0
maior_MEM=0.0


valor=0.0

    for i in $(seq 1 $N);do
    sleep $S

    ps aux | grep ^$P_USER > file.txt
    
   new_file=file.txt 
    if [[ -s $new_file ]] ; then
   

 
        while read line;do
            valor=$(echo $line | cut -d" " -f3)
            echo $valor


            if [ $(echo "$valor > $maior_CPU" |bc) ] ; then
              
                  maior_CPU=$valor
            fi
            
            CPU=$(bc -l <<< "$CPU+$valor")

            valor=$(echo $line | cut -d" " -f4)

            if [ $(echo "$valor > $maior_MEM" | bc) ] ; then

                maior_MEM=$valor
            fi

            MEM=$(bc -l <<< "$MEM+$valor")

        done < file.txt

    fi
        echo "%CPU encontrado: $CPU"
    
        echo

        echo "Maior %CPU encontrado: $maior_CPU"

        echo

        echo "%MEM encontrada: $MEM"

        echo

        echo "Maior %MEM encontrada: $maior_MEM"



    done


