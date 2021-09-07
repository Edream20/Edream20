#!/bin/bash

USUARIO=$1

if [ $# -ne 1 ] ; then
        echo "Usar: $0 <nombre de usuario> "
        exit
fi

## POI
TAC=@iberica.tac.voipi.com.ar
SUI=@onix.sui.voipi.com.ar
ESM=@neba.voipi.com.ar
ROS=@cornuda.ros.voipi.com.ar
CBA=@macaya.cba.voipi.com.ar
LAM=@huascaran.lim.anura.pe
LIM=@paracas.lim.anura.pe

## Menu con opciones
echo -e "\n 1 - TACUARI \n 2 - SUIPACHA \n 3 - ESMERALDA \n 4 - ROSARIO \n 5 - CORDOBA \n 6 - LA MOLINA \n 7 - SAN ISIDRO"
echo
echo -n "Elija la opcion deseada: "
read POI
echo
echo -e "\n 1 - IP POWER \n 2 - UPS \n 3 - PDU \n 4 - SWITCH \n 5 - IPMI \n 6 - CHIPERA"
echo
echo -n "Elija la opcion deseada: "
read HW

INPUT=$POI$HW

  case $INPUT in
        ## TACUARI
     11)
        ssh -p 54322 -L 16252:10.10.16.252:80 -L 16251:10.10.16.251:80 -f -N $USUARIO$TAC
	     echo -e "\n U = apc \n P = apc"
        echo -e "\n IP-Power 1 localhost:16251 \n \n \n IP-Power 2 localhost:16252"
        echo
     ;;
     13)
        ssh -p 54322 -L 16250:10.10.16.250:80 -f -N $USUARIO$TAC
	     echo -e "\n U = apc \n P = apc"
        echo -e "\n IP-PDU localhost:16250"
        echo
     ;;
     14)
        ssh -p 54322 -L 16254:10.10.16.254:80 -L 16253:10.10.16.253:80 -f -N $USUARIO$TAC
	     echo -e "\n U = admin \n P = Sin Passsword"
        echo -e "\n SW_TAC_1920S_1 localhost:16254 \n \n \n SW_TAC_1920S_2 localhost:16253"
        echo
     ;; ## SUIPACHA
     21)
        ssh -p 54322 -L 11104:10.10.11.104:80 -f -N $USUARIO$SUI
	     echo -e "\n U = admin \n P = laranita \n \n Usar Google Chrome"
        echo -e "\n IP POWER SUI localhost:11104"
        echo
     ;;
     22)
        ssh -p 54322 -L 11106:10.10.11.106:80 -L 11107:10.10.11.107:80 -L 11108:10.10.11.108:80 -f -N $USUARIO$SUI
	     echo -e "\n U = apc \n P = apc"
        echo -e "\n UPS_1 localhost:11106 \n UPS_2 localhost:11107 \n UPS_3 localhost:11108"
        echo
     ;;
     24)
        ssh -p 54322 -L 11250:10.10.11.250:80 -L 11249:10.10.11.249:80 -L 11248:10.10.11.248:80 -L 11247:10.10.11.247:80 -f -N $USUARIO$SUI
	     echo -e "\n U = admin \n P = Sin Passsword"
        echo -e "\n SW_SUI_v1920_1 localhost:11250 \n SW_SUI_v1920_2 localhost:11249 \n SW_SUI_v1920_3 localhost:11248 \n SW_SUI_v1920_4 localhost:11247"
        echo
     ;; ## ESMERALDA
     31)
        ssh -p 54322 -L 10104:10.10.10.104:80 -f -N $USUARIO$ESM
	     echo -e "\n U = admin \n P = laranita \n \n Usar Google Chrome" 
        echo -e "\n IP Power localhost:10104"
        echo
     ;;  
     32)
        ssh -p 54322 -L 10108:10.10.10.108:80 -L 10109:10.10.10.109:80 -f -N $USUARIO$ESM
	     echo -e "\n Sin Usuario y contraseña"
        echo -e "\n UPS_1 localhost:10108 \n \n \n UPS_2 localhost:10109"
        echo
     ;;
     34)
        ssh -p 54322 -L 10250:10.10.10.250:80 -L 10249:10.10.10.249:80 -f -N $USUARIO$ESM
	     echo -e "\n U = admin \n P = Sin Passsword"
        echo -e "\n SW_ESM_v1910_1 localhost:10250 \n \n \n SW_ESM_1910_2 localhost:10249"
        echo
     ;; ## ROSARIO
     42)
        ssh -p 54322 -L 124:10.10.12.4:80 -f -N -l $USUARIO$SUI
	     echo -e "\n U = root \n P = laranita1"
        echo -e "\n UPS localhost:124"
        echo
     ;; ## CORDOBA
     52)
        ssh -p 54322 -L 134:10.10.13.4:80 -f -N -l $USUARIO$SUI
	     echo -e "\n U = apc \n P = apc"
        echo -e "\n UPS localhost:134"
        echo
     ;;  ## LA MOLINA
     62)
        ssh -p 54322 -L 15222:10.10.15.221:443 -f -N $USUARIO$LAM
	     echo -e "\n U = apc \n P = anuraapc"
        echo -e "\n UPS2LAM localhost:15222"
        echo
     ;;
     64)
        ssh -p 54322 -L 15254:10.10.15.254:80 -L 15253:10.10.15.253:80 -f -N $USUARIO$LAM
	     echo -e "\n U = admin \n P = Sin Passsword"
        echo -e "\n SW_LAM_1920S_1 localhost:15254 \n \n \n SW_LAM_1920S_2 localhost:15253"
        echo
     ;;  ## SAN ISIDRO
     73)
        ssh -p 54322 -L 14011:10.10.14.11:32180 -L 14012:10.10.14.12:32180 -f -N $USUARIO$LAM
	     echo -e "\n U = admin \n P = z4p4t1ll41p"
        echo -e "\n pdu-apc-01-pe localhost:14011 \n \n \n pdu-apc-02-pe localhost:14012 \n \n"
        echo
     ;;   
     74)
        ssh -p 54322 -L 14254:10.10.14.254:80 -L 14253:10.10.14.253:80 -f -N $USUARIO$LIM
	     echo -e "\n U = admin \n P = Sin Passsword"
        echo -e "\n SW_LIM_2928_1 localhost:14254 \n \n \n SW_LIM_2928_2 localhost:14253 \n \n"
        echo
     ;;
     72)
        ssh -p 54322 -L 14211:10.10.14.211:80 -f -N $USUARIO$LIM
	     echo -e "\n U = apc \n P = anuraapc"
        echo -e "\n UPS LIM localhost:14211"
        echo
     ;;      
     75)
        ssh -p 54322 -L 14213:10.10.14.213:443 -L 14214:10.10.14.214:443 -L 14216:10.10.14.216:443 -L 14217:10.10.14.217:443 -L 14219:10.10.14.219:443 -f -N $USUARIO$LIM
	     echo -e "\n U = ANURA \n P = Sup3rg3st10n"
        echo -e "\n PARACAS localhost:14213 \n \n \n NAZCA localhost:14214 \n \n \n MOCHE localhost:14216 \n \n \n CHIMU localhost:14217 \n \n \n CHAVIN localhost:14219"
        echo
     ;;
     *)
        echo "Veriificar que este el Tunel Agregado / Opcion Incorrecta"
     ;;
  esac