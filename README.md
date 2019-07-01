# PIR-Sensor
Script to read data from PIR-Sensor for the Raspberry PI
If the Sensor detects movement the screen is turned on. When no movement is detected for longer than 60 seconds, 
the screen will be automatically turned off.

I use this script in combination with the service for my magic mirror. 

Put the "pir" file in the the "/usr/local/sbin/" folder.

Make it executable "sudo chmod u+x /usr/local/sbin/pir"

Put the "pir.service" file in "/etc/systemd/system" directory. 

Tell systemd to start the services automatically at boot. "sudo systemctl enable pir.service"

Done.
