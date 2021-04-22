
import serial 
import time

class melfa_robot():

    def __init__(self, portname:str=None):
        if portname is None:
            raise Exception('portname cannot be None')
        self._cntr = 0
        self.ser = serial.Serial(portname, 9600, bytesize=serial.EIGHTBITS, stopbits=serial.STOPBITS_TWO , parity = serial.PARITY_EVEN ) 

    def open(self, portname):
        ''' open serial port
        '''
        self.ser = serial.Serial(portname, 9600, bytesize=serial.EIGHTBITS, stopbits=serial.STOPBITS_TWO , parity = serial.PARITY_EVEN ) 

    def close(self):
        ''' close serial port
        '''
        self.ser.close()

    def sent_to_ser(self, cmdstr):
        '''
        Send command to robot and get reply with fscanf
        function reply = SendCmd(cmd) 
        '''
        cmdstr+='\r'
        self.ser.write(cmdstr.encode())
        time.sleep(0.02)
        inw=self.ser.in_waiting
        self._cntr+=1
        line = ""
        if inw >0:
            line = self.ser.read(inw)
            print("cntr: {} , {}, {}".format(self._cntr, inw,line))
        return str(line)

    def cntl(self, CONTROLSTATE):
        if CONTROLSTATE:
            statestr='ON'
        else:
            statestr='OFF'
        self.sent_to_ser('1;1;CNTL{}'.format(statestr))

    def safemode(self):

        self.RSTALRM()
        self.cntl(True)
        self.srv(True)
        # self.ovrd(10.0)
        # self.jovrd(10.0)   #set default JOVR / OVRD
        # self.set_accel(20,20);

    def RSTALRM(self):
        self.sent_to_ser('1;1;RSTALRM')

    def srv(self, servo_state):
        #%SET SERVO ON / OFF (1 /0)
        if servo_state==1 or servo_state:
            servo_state='ON'
        elif servo_state==0 or not servo_state:
            servo_state='OFF'
        cmd='1;1;SRV{}'.format( servo_state.upper() )
        self.sent_to_ser(cmd)

    def ovrd(self, val:float) -> bool:
        ''' set base speed
        OVRD(ovrd)
        '''
        ex=False 
        if val>0 and val<=100:
            cmd='1;1;EXECOVRD {}'.format(val) 
            reply= self.sent_to_ser(cmd)
            ex='QoK' in reply
        else:
            print('LATHOS')
        return ex

    def jovrd(self, val ):
        '''       %SET JOG SPEED %
        '''
        ex=False  
        if val>0 and val<=100:
            cmd='1;1;EXECJOVRD {}'.format(val) 
            reply= self.sent_to_ser(cmd)
            ex='QoK' in reply
        else:
            print('LATHOS in Jog speed')
        return ex

    def mvj(self, coords_list):
        coords = ""
        for item in coords_list:
            coords = coords+"{:.3f}, ".format(item)
        coords = coords[:-2]
        command_string = '1;1;EXEC JMOV = ({})'.format(coords)
        self.sent_to_ser(command_string)
        self.sent_to_ser('1;1;EXECMOV JMOV')
        return command_string

    def mov(self, coords_list):
        coords = ""
        for item in coords_list:
            coords = coords+"{:.3f}, ".format(item)
        coords = coords[:-2]
        command_string = '1;1;EXEC PMOV = ({})'.format(coords)
        self.sent_to_ser(command_string)
        self.sent_to_ser('1;1;EXECMOV PMOV')
        return command_string

    def move_abs(self, Pabs):
        # command_string = '{}'.format(1).encode()
        # self.ser.write(command_string)
        pass

    def move_rel(self, dx=0, dy=0, dz=0):
        # command_string = '{}'.format(1).encode()
        # self.ser.write(command_string)
        pass

    def servo(self, state):
        # command_string = '{}'.format(1).encode()
        # self.ser.write(command_string)
        pass

    def get_position(self):
        cmd = '1;9;PPOSF'
        reply=self.sent_to_ser(cmd)
        return reply
        
    def get_state(self):
        cmd='1;1;DSTATE'
        reply=self.sent_to_ser(cmd)
        return reply

    def set_accel(self, accel, deccel=None):
        # function ex=ACCEL(accel,varargin)
        
        deccel=accel if deccel is None else deccel
        ex = False
        if accel>0 and accel<=400 and deccel>0 and deccel<=400:
            cmd='1;1;EXECACCEL {},{}'.format(accel, deccel) ;
            print(cmd)
            reply= self.sent_to_ser(cmd)
            ex='QoK' in reply
        else:
             print('LATHOS ACCEL')
        return ex

    def set_velocity(self, velocity):
        # command_string = '{}'.format(1).encode()
        # self.ser.write(command_string)
        pass
# %%
