#!/bin/bash

if [ $# -eq 3 ] ; then

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
    exit 1
    
    elif [ -z $S ] ; then
    exit 1

    elif [ -z $P_USER ] ; then
    exit 1
    
    elif [ $N -le 0 ] ; then
    exit 1

    elif [ $S -le 0 ] ; then
    exit 1
    
    fi



    for i in $(seq 1 $N);do

    CPU=0
    maior_CPU=0
    menor_CPU=100

    MEM=0
    maior_MEM=0
    menor_MEM=100


    valor=0


    ps aux | grep ^$P_USER > file.txt
    
   new_file=file.txt
 
    if [[ -s $new_file ]] ; then

 
        while read line;do            

            valor=$(echo $line | cut -d" " -f3)


            if [ $(echo "$valor > $maior_CPU" | bc) -eq 1 ] ; then
              
                  maior_CPU=$valor
            fi


            if [ $(echo "$valor < $menor_CPU" | bc) -eq 1 ] ; then
                    
                menor_CPU=$valor
            fi
                
            
            CPU=$(bc -l <<< "$CPU+$valor")

            valor=$(echo $line | cut -d" " -f4)
            
            if [ $(echo "$valor > $maior_MEM" | bc) -eq 1 ] ; then

                maior_MEM=$valor
            fi

            
            if [ $(echo "$valor < $menor_MEM" | bc) -eq 1 ] ; then
                
                menor_MEM=$valor

            fi



            MEM=$(bc -l <<< "$MEM+$valor")

        done < file.txt

    fi
        echo "%CPU encontrado: $CPU"
    
        echo

        echo "Maior %CPU encontrado: $maior_CPU"

        echo

        echo "Menor %CPU encontrado: $menor_CPU"

        echo

        echo "%MEM encontrada: $MEM"

        echo

        echo "Maior %MEM encontrada: $maior_MEM"

        echo
    
        echo "Menor %MEM encontrada: $menor_MEM"

      
        sleep $S
    

    done


