
docker run --rm -it \
		   -p 8080:8080 \
           -p 2022:22 \
           -e DISPLAY_WIDTH=1352 \
           -e DISPLAY_HEIGHT=878 \
		   -v /Users/mkluge/Pictures/:/data \
           linuxdesktop:latest 
    
xdg-open http://localhost:8080/vnc.html
