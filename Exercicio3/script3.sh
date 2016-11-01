#!/bin/sh

if [ "$1" = "" ] ; then
    (ls | grep .sh) > aux1
    (ls | grep .in) > aux2

    while read line1 ; do
    
        string1="$(echo $line1 | cut -d"_" -f2)"
        
        while read line2 ; do

            string2="$(echo $line2 | cut -d"_" -f2)"

            if [ $string1 = $string2 ] ; then
                
                string3="$(echo $line2 | cut -c 13)"

                int=$(./$line1 < $line2)
                
                echo $int > aux3
                

                saida="$(echo $line2 | cut -d"." -f1).out"
                
               echo "$(echo $line1 | cut -d"." -f1):"

               echo "- SAIDA PARA ENTRADA $string3: "

               echo $int

               echo "- DIFERENCA PARA A SAIDA ESPERADA:"

               diff aux3 $saida

               echo
               echo
                
               rm aux3

            fi

        done < aux2

    done < aux1

    rm aux2
    rm aux1

elif [  "$2" = "" ] ; then

        (ls | grep .sh) > aux1
        (ls | grep .in) > aux2

        exercicio="EXERCICIO_$1"

        cat aux1 |  grep $exercicio > aux4

        numero_linhas=$(cat aux4 | wc -l)

        if [ numero_linhas -gt 0 ] ; then

            while read line1 ; do
                                
                if [ "$(echo $line1 | cut -d"_" -f2)" = $1 ] ; then

                    while read line2 ; do

                        string2="$(echo $line2 | cut -d"_" -f2)"

                        if [ $string2 = $1 ] ; then
                           
                             string3="$(echo $line2 | cut -c 13)"
                                
                             int=$(./ $line1 < $line2) > aux3

                             saida="$(echo $line1 | cut -d"." f1).out"
                            
                             
                            echo "$(echo $line1 | cut -d "." f1):"

                            echo "- SAIDA PARA ENTRADA $string3:"
                            
                            echo $int

                            echo "- DIFERENCA PARA A SAIDA ESPERADA:"
                            diff aux3 $saida
                            
                            echo
                            echo

                            rm aux3
                        fi

                    done < aux2

                fi

            done < aux1

        rm aux2
        rm aux1
        rm aux4
    fi

else

    exercicio="EXERCICIO_$1_$2.sh"

    ls | grep $exercicio > aux4

    numero_linhas=$(cat aux4 | wc -l)

    if [ $numero_linhas -gt 0 ] ; then
        (ls | grep .in) > aux2        


        while read line2 ; do

            string2="$(echo $line2 | cut -d"_" -f2)"
            
            if [ "$string2" = $1 ] ; then
                string3="$(echo $line2 | cut -c 13)"

                int=$(./$exercicio < $line2)

                echo $int > aux3

                saida="$(echo $line2 | cut"." -f1).out"


                echo"$(echo $exercicio | cut -d"." -f1):"
                
                echo "- SAIDA PARA ENTRADA $string1"
                
                echo $int

                echo "- DIFERENCA PARA A SAIDA ESPERADA:"

                diff aux3 $saida

                echo

                echo


                rm aux3

            fi
        
         done < aux

        rm aux2
    fi

fi




