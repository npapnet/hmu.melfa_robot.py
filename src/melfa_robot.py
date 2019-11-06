import serial 

class melfa_robot():

    def __init__(self, portname:str=None):
        if portname is None:
            raise Exception('portname cannot be None')
        self.ser = serial.Serial(portname, 9600, bytesize=serial.EIGHTBITS, stopbits=serial.STOPBITS_TWO , parity = serial.PARITY_EVEN ) 

    def move_abs(self, Pabs):
        # command_string = '{}'.format(1).encode()
        # self.ser.write(command_string)
        pass

    def move_rel(self, dx=0, dy=0, dz=0):
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

    def get_position(self, state):
        # command_string = '{}'.format(1).encode()
        # self.ser.write(command_string)
        pass

    def get_state(self, state):
        # command_string = '{}'.format(1).encode()
        # self.ser.write(command_string)
        pass

    def set_accel(self, accel):
        # command_string = '{}'.format(1).encode()
        # self.ser.write(command_string)
        pass

    def set_velocity(self, velocity):
        # command_string = '{}'.format(1).encode()
        # self.ser.write(command_string)
        pass