# load('RV2A.mat');
#%%
import serial
import time
# matlab code from psy_connect.m 
# 
#%%
from  melfa_robot import melfa_robot
#%%

mr0 = melfa_robot(portname='COM4')
#%%
mr0.get_position()
print(mr0.ser.read(mr0.ser.in_waiting))
#%%

# OPENCOM(1)  %connects to selected COM
# CNTL(1)     % Enables Controller/ Must be in auto mode
mr0.cntl(1)
#%%
#mr0.RSTALRM()
mr0.srv('On')
#mr0.srv(0)
mr0.ovrd(20)
mr0.set_accel(20)
#%%
#a=mr0.get_state()
#print(a)
P1=[350,0,500,179,0,179]
P2=[350,0,400,179,0,179]
#
mr0.mov(P2)
mr0.mov(P1)

#mr0.mvj([0,0,90,0,90,0])
#%%
'''
mr0.mvj([0,0,90,0,40,0])
#%%

# SAFEMODE()    % Enters SafeMode Speeds
mr0.safemode()
#SPD(10)         % Sets max speed
mr0.ovrd(10)
#JOVRD(10)   %Sets max koint speeds
mr0.jovrd(10)
# ACCEL(5,5)  #ets Acceration
mr0.set_accel(5, 5)
# SRV(1)      #Opens SERVOS
mr0.srv('On')  
#%%               
mr0.close()
#%%    
# MOV('P_SAFE')
# % pdown=GETPOSITION()

# SETPOINT('targ', 440 , 40 , 500 , 180, 0 , -180) % Sets point with name: P&str ,coords
# MOV('Ptarg')

# MOVE_BASE_X(10)   %ws pros th bash
# %MOVE_BASE_Y(10)

# MOVETOOLZ(-10)   %ws pros Tool
# ROT_TOOL_Z(5)

# TOOL(10, 10, 0,  0,   0,  0)

# % set_joints_angles('J' , 0, 0 , 0 , 0 ,0 ,0)
# % MOV('J')


# % 
# SRV(0)
 CLOSECOM 
 
 '''