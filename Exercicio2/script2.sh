#!/bin/bash

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

	for i in $(seq 1 $N);do
    sleep $S

	ps aux | grep ^$P_USER > file.txt
    
   new_file=file.txt 



	done

CPU=0
maior_CPU=0

MEM=0
maior_MEM=0


valor=0


    if [[ -s $new_file ]] ; then
   

 
        while read line;do
            valor=$(echo $line | cut -d"$P_USER" -f2)
            echo $valor


            if [ $valor -gt $maior_CPU ] ; then
              
                  maior_CPU=$valor
            fi
            
            CPU=$(echo "$CPU+$valor" | bc)

            valor=$(echo $line | cut -d"$P_USER" -f3)

            if [ $valor -gt $maior_MEM ] ; then

                maior_MEM=$valor
            fi

            MEM=$(echo "$MEM+$valor" | bc)

        done < file.txt

    fi



echo "%CPU encontrado: $CPU"

echo

echo "Maior %CPU encontrado: $maior_CPU"

echo

echo "%MEM encontrada: $MEM"

echo

echo "Maior %MEM encontrada: $maior_MEM"


