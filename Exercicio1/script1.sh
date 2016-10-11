#!/bin/bash


#Baixando o arquivo
wget http://ita.ee.lbl.gov/traces/calgary_access_log.gz

#Descompactando o arquivo
gunzip calgary_access_log.gz

#Removendo linhas fora do padrao
sed -i "/ - - /!d" calgary_access_log

#Contando quantas requisicoes locais foram feitas
locals=$(grep "local" calgary_access_log | wc -l)

#Contando quantas requisicoes remotas foram feitas
remotes=$(grep "remote" calgary_access_log | wc -l)


hora=0

media_locals=0

media_remotes=0





while read line;do
    

    hora=$(echo $line | cut -d ":" -f2)

    if [[ $line == *"local"* ]];then
       media_locals=$(($media_locals+10#$hora))
    
    else
        media_remotes=$(($media_remotes+10#$hora))

    
    fi

    
    

done < calgary_access_log

echo $media_locals

echo $media_remotes



