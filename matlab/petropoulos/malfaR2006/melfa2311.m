

global RSTATE;
for i=1:25
    cmd=['1;1;DSTATE'];
fprintf(s,cmd);
        pause(0.05);

st = hex2dec(substr(fscanf(s), 3, 2));
RSTATE.Stopped = bitand(st,64) == 0;               % 0 = RUN, 1 = STOP

while RSTATE.Stopped == 0
  cmd=['1;1;DSTATE'];
fprintf(s,cmd);
        pause(0.05);

st = hex2dec(substr(fscanf(s), 3, 2));
RSTATE.Stopped = bitand(st,64) == 0;               % 0 = RUN, 1 = STOP
    pause(0.1)
end

    %%
    z=210;
    A=180;
    B=0;
    C=180;
    cmd=['1;1;EXECPCOSIROP = ('  num2str(x(i),'%10.3f') ', ' num2str(y(i),'%10.3f') ', ' num2str(z,'%10.3f') ', ' num2str(A,'%10.3f') ', ' num2str(B,'%10.3f') ', ' num2str(C,'%10.3f') ')'];
      fprintf(s,cmd);
      pause(0.02);
      fscanf(s);
      %%
      
      cmd=['1;1;EXECMVS PCOSIROP'];
        fprintf(s,cmd);
        pause(0.02);
        fscanf(s);
        
end
