addpath(genpath('C:\Users\fasoulas\Desktop\Psyllakis\Matlab\RV2A_MATLAB_FUNCTIONS_VER2'))
load('RV2A.mat');
% 
OPENCOM(1)  %connects to selected COM
CNTL(1)     % Enables Controller/ Must be in auto mode
SAFEMODE()    % Enters SafeMode Speeds

SPD(10)         % Sets max speed
JOVRD(10)   %Sets max koint speeds
ACCEL(5,5)  %Sets Acceration
SRV(1)      %Opens SERVOS

    
MOV('P_SAFE')
% pdown=GETPOSITION()

SETPOINT('targ', 440 , 40 , 500 , 180, 0 , -180) % Sets point with name: P&str ,coords
MOV('Ptarg')

MOVE_BASE_X(10)   %ws pros th bash
%MOVE_BASE_Y(10)

MOVETOOLZ(-10)   %ws pros Tool
ROT_TOOL_Z(5)

TOOL(10, 10, 0,  0,   0,  0)

% set_joints_angles('J' , 0, 0 , 0 , 0 ,0 ,0)
% MOV('J')


% 
SRV(0)
CLOSECOM 