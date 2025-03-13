#!/usr/bin/bash
read -p "choose env :" temp

case $temp in
	dev)
		ENVIRON='dev'
		;;
	prod)
		ENVIRON='prod'
		;;
	test)
		ENVIRON='test'
		;;
	*)
		echo "error try again"
		;;
esac

echo $ENVIRON
