#!/usr/bin/python

import RPi.GPIO as GPIO
import time
import os
import sys

GPIO.setmode(GPIO.BCM)

 
#Define GPIO PIN
PIR_GPIO = 26
#Configure GPIO
GPIO.setup(PIR_GPIO,GPIO.IN)
 
read=0
wait=1
timeout=60
timer=0
 
try:  
 #Read PIR
 while GPIO.input(PIR_GPIO)==1:
   read=0
 
 #Stop with CTRL+C 
 while True: 
   #Read GPIO and check for movement
   read = GPIO.input(PIR_GPIO)
   
   #Reset timer when there is movement
   if read==1:
     timer=0  

   #Turn display on when movement and display was off before
   if read==1 and wait==0:  
     os.system("vcgencmd display_power 1")
     wait=1

   #Turn display off when timeout is reached
   elif read==0 and wait==1 and timer>60:
     os.system("vcgencmd display_power 0")
     wait=0

   timer=timer+1
   time.sleep(1)
 
except KeyboardInterrupt:
 GPIO.cleanup()

