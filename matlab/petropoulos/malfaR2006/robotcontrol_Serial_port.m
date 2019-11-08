% establishing the connection between PC and controller
function portopen()
global s;
s = serial('COM1', 'BaudRate', 9600, 'DataBits', 8,'Parity', 'EVEN', 'StopBits', 2,'terminator','CR');
fopen(s)
   fprintf(s,['1;1;EXECJOVRD 8']);
      fprintf(s,['1;1;EXECOVRD 8']);
   fprintf(s,'1;1;RSTALRM');
   pause(0.2);
   fprintf(s,'1;1;CNTLON');
   pause(0.2);
   fprintf(s,'1;1;SRVON');
   pause(0.2);
% closing connection
function portclose()
    global s;
    fprintf(s,'1;1;SRVOFF');
    pause(0.2);
    fclose(s);
    s=-1;
% sending cosirop command
function robotcontrol(handles,o1,o2,o3,o4,o5,speed)
global s;
   % cm -string, cosirop command EXECJCOSIROP
   cm=['1;1;EXECJCOSIROP = (' num2str(0,'%10.3f') ', '  num2str(0,'%10.3f') ', '  num2str(90,'%10.3f')  ', 0.000 , '  num2str(90,'%10.3f') ', '  num2str(90,'%10.3f') ')'];
   %set(handles.commandtext,'String',cm); % showing in the GUI cm   
   % fprintf(t,['1;1;EXECJOVRD 35.0']);
   fprintf(s,cm);
   pause(0.05);
   fprintf(s,'1;1;EXECMOV JCOSIROP');
   pause(0.05);
   
   
   
   
   %%%%%MOV JOINT - POINT
   cm=['1;1;EXECJCOSIROP = (' num2str(0,'%10.3f') ', '  num2str(0,'%10.3f') ', '  num2str(80,'%10.3f')  ', ' num2str(0,'%10.3f') ' , '  num2str(0,'%10.3f') ', '  num2str(0,'%10.3f') ')'];
    fprintf(s,cm);
   pause(0.05);
   fprintf(s,'1;1;EXECMOV JCOSIROP');
   
   
   %POINT
  cm=['1;1;EXECP8 = (450,50,350,180,0,180)']; fprintf(s,cm); pause(0.05);
          
     fprintf(s,'1;1;EXECMOV P10');
        pause(0.05);
 fscanf(s)
        pause(0.05);

     fprintf(s,'1;1;DSTATE');
        pause(0.05);
        %pause(3);
        %%%%%
runst = hex2dec(substr(fscanf(s), 3, 2));
st=runst;
RSTATE.CycleOrRepeat = bitand(st,1) ~= 0;          % 0 = Cycle, 1 = Repeat
RSTATE.CycleStop = bitand(st,2) ~= 0;              % 0 = ON, 1 = OFF
RSTATE.Mlock = bitand(st,4) ~= 0;                  % 0 = OFF, 1 = ON
RSTATE.AutoOrTeach = bitand(st,8) ~= 0;            % 0 = AUTO, 1 = TEACH
RSTATE.RunningOfTeachMode = bitand(st,16) ~= 0;    % 0 = OFF, 1 = ON
RSTATE.ServoOn = bitand(st,32) ~= 0;               % 0 = OFF, 1 = ON
RSTATE.Stopped = bitand(st,64) == 0;               % 0 = RUN, 1 = STOP
RSTATE.ControlOn = bitand(st,128) ~= 0;            % 0 = OFF, 1 = ON
RSTATE.Invalid = bitand(st,256) ~= 0;              % 0 = Valid, 1 = Invalid
%%%%%%
     
        pause(0.05);

      fprintf(s,'1;9;DSTATE');
         pause(0.05);

     fscanf(s)
     
        fprintf(s,'1;1;RSTALRM');
        
        % QoKX;407.34;Y;0.00;Z;786.20;A;0.00;B;80.00;C;0.00;;7,0;100;0.00;0
        % 0000000
        
        
        
        % FSCANF (S)
        fscanf(s)
        
        
        fprintf(s,'1;9;PPOSF')
        pause(0.02)
        position=fscanf(s)

        
        %STATE
        fprintf(s,'1;1;STATE')
        pause(0.02)
        state=fscanf(s)
        
        
        %LIST
        fprintf(s,'1;9;LIST')
        pause(0.02)
        list=fscanf(s)
        
        fprintf(s,'1;1;STOP')