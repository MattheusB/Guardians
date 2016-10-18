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



