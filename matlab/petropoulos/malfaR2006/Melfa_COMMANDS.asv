%Open Communication
function open_communication()
global s;
s = serial('COM1', 'BaudRate', 9600, 'DataBits', 8,'Parity', 'even', 'StopBits', 2, 'Terminator','CR');

    fopen(s);
    fprintf(s,['1;1;EXECJOVRD 8.0']);   %set default JOVR / OVRD
    pause(0.2);
    
    fprintf(s,['1;1;EXECOVRD 8.0']);
    pause(0.2);
    
    fprintf(s,'1;1;RSTALRM');
    pause(0.2);
    
    fprintf(s,'1;1;CNTLON');
    pause(0.2);
    
    fprintf(s,'1;1;SRVON');
    
    
 %Close Communication
 function close_cummuntication()
        global s;
        fprintf(s,'1;1;SRVOFF');
        pause(0.2);
        fclose(s);
        delete(s);
        s=-1;
        
        
        
        
        
 %Set Joints angles degrees command
function set_joints_angles(q1, q2 ,q3 ,q4 ,q5 ,q6)   %times 
    
    %for i=1:6
    %eval([genvarname(['Q',num2str(i)]),'=num2str(q(i))'])
    %end
    %cmd=['1;1;EXECJCOSIROP = (' Q1 ', ' Q2 ', ' Q3 ', ' Q4 ', ' Q5 ', ' Q6 ')']
    
         cmd=['1;1;EXECJCOSIROP = (' num2str(q1,'%10.3f') ', ' num2str(q2,'%10.3f') ', ' num2str(q3,'%10.3f') ', ' num2str(q4,'%10.3f') ', ' num2str(q5,'%10.3f') ', ' num2str(q6,'%10.3f') ')'];
         fprintf(s,cmd);
         
         %rotation_joints();
         
         
         
%Rotation Joints (MOV)
function rotation_joints()
     cmd=['1;1;EXECMOV EXECJCOSIROP'];
     fprintf(s,cmd);
             
     
%Set Point
function set_point(nop, x, y , z , A , B , C) %nop>name of point
      cmd=['1;1;EXEC' nop ' = ('  num2str(x,'%10.3f') ', ' num2str(y,'%10.3f') ', ' num2str(z,'%10.3f') ', ' num2str(A,'%10.3f') ', ' num2str(B,'%10.3f') ', ' num2str(C,'%10.3f') ')'];
      fprintf(s,cmd);
      
      
%MOVE TO POINT (MOV command)
function MOVE(nop)     %name of point (STRING)
        cmd=['1;1;EXECMOV ' nop];
        fprintf(s,cmd);
        
%STOP execution
function STOP()
    cmd=['1;1;STOP'];
    fprintf(s,cmd);
         
%GET POSITION
function get_position()
     cmd=['1;9;PPOSF'];
     fprintf(s,cmd);  
     %robotposition=fscanf(s);    %na vrw pws adeiazei i seiriaki
         
%GET STATE 
function get_state()
      cmd=['1;9;STATE'];
      fprintf(s,cmd);
      %robotstate=fscanf(s)
      
%SET BASE SPEED %
function set_ovrd(ovrd)
      cmd=['1;1;EXECOVRD' num2str(ovrd) ];
      fprintf(s,cmd);
      
%SET JOINT SPEED %
function set_jovrd(jovrd)
      cmd=['1;1;EXECJOVRD' num2str(jovrd) ];
      fprintf(s,cmd);
      
      
      
%SET SERVO ON / OFF (1 /0)
function set_servo(SERVOSTATE)   %SERVOSTATE 'ON' 'OFF' 1 0
%     if SERVOSTATE==1
%         SERVOSTATE='ON'
%     elseif SERVOSTATE==0
%             SERVOSTATE='OFF'
%     end
      cmd=['1;1;SRV' SERVOSTATE ];
      fprintf(s,cmd);
      
      fprintf(s,'1;1;EXECACCEL 20, 20');
%SET CONTROL ON / OFF 
function set_servo(CONTROLSTATE)   %CONTROLSTATE 'ON' 'OFF' 1 0
%     if CONTROLSTATE==1
%         CONTROLSTATE='ON'
%     elseif CONTROLSTATE==0
%             CONTROLSTATE='OFF'
%     end
      cmd=['1;1;CNTL' CONTROLSTATE ];
      fprintf(s,cmd);
      
      
%RESET ALARM
function reset_alarm()
     cmd=['1;1;RSTALRM'];
     fprintf(s,cmd);
      
         
        