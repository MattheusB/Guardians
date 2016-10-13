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

echo "Requisicoes locais feitas: $locals"

echo "Requisicoes remotas feitas: $remotes"




#Soma das horas das requisicoes feitas tanto remotas quanto locais

while read line;do
    
        hora=$(echo $line | cut -d":" -f2)

        if [[ $line == *"local"* ]];then
            media_locals=$(echo "$media_locals+$hora" | bc)
            echo $media_locals
        else
            media_remotes=$(echo "$media_remotes+$hora" | bc)
            echo $media_remotes      

       fi

    
    

done < calgary_access_log


media_locals=$(echo  "$media_locals/$locals" | bc)

media_remotes=$(echo "$media_remotes/$remotes" | bc)


echo "Media das horas locais: $media_locals"

echo "Media das horas remotas: $media_remotes"



