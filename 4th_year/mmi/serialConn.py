import sys
sys.path.append('../')
from rpi import SerialHandler
import threading
from threading import Thread




#obstacle
waitline = b'OBST\r\n'
try:
        ser = serial.Serial("/dev/ttyUSB0", 9600)

except:
        print("Arduino nu e pe USB0")
if(ser==None):
        try:
                ser = serial.Serial("/dev/ttyUSB1", 9600)
        except:
                print("Arduino nu e pe USB1")





def cameraOptim():
        serialHandler = SerialHandler.SerialHandler("/dev/ttyACM0")
        serialHandler.startReadThread()
 
                if(waitline != ser.readline()):
                
                        if m1 < 0 and m2 < 0:
                                moveRight()
                                time.sleep(0.1)
                                #dontMove()
                        elif m1 > 0 and m2 > 0:
                                moveLeft()
                                time.sleep(0.1)
                                #dontMove()
                        else:
                                moveForward()
                                time.sleep(0.1)
                                #dontMove()
                else:
                        dontMove()
                        print("OBSTACLE AHEAD")
                
                if cv2.waitKey(1) & 0xFF == ord('q'):
                    break
        cv2.destroyAllWindows()
        vs.stop()
        


    
try:
        t4 = threading.Thread(name='CameraOptim', target = cameraOptim)
        t4.start() 
except:
   print("Error: unable to start thread")


