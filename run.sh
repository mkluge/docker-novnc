
LDIR=$HOME
if [ "$1" != "" ] ; then
	LDIR=$1
fi

docker run --rm -it \
		   -p 8080:8080 \
           -p 2022:22 \
           -e DISPLAY_WIDTH=1352 \
           -e DISPLAY_HEIGHT=878 \
		   -v $LDIR:/data \
           linuxdesktop:latest 
    
