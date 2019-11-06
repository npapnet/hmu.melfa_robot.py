import serial as serial
import time

with  serial.Serial("com3", 9600, bytesize=serial.EIGHTBITS, stopbits=serial.STOPBITS_TWO
    , parity = serial.PARITY_EVEN ) as ser:
    x=0 
    cntr = 0

    try:
        while True:
            inw=ser.in_waiting
            cntr +=1
            print("cntr: {} , {}".format(cntr, inw))
            if inw >0:
                line = ser.read(inw)
                print(line)
            time.sleep(0.1)
            
    except KeyboardInterrupt:
        pass