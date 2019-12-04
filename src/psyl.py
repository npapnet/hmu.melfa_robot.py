# load('RV2A.mat');

# matlab code from psy_connect.m 
# 
#%%
import melfa_robot as mr 
#%%

mr0 = mr.melfa_robot(portname='com3')
#%%
mr0.get_position()
print(mr0.ser.read(mr0.ser.in_waiting))
#%%

# OPENCOM(1)  %connects to selected COM
# CNTL(1)     % Enables Controller/ Must be in auto mode
mr0.cntl(True)

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
# CLOSECOM 