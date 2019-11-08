OPENCOM(1)
CNTL(1)
SPD(10)
JOVRD(10)
ACCEL(20,20)
SRV(1)
MOV('P2')
cz=1;
cx=1;
cp2=1;
tic
MOV('P_SAFE')
%%
% for i=1:1:2
%%
    a=GETSTATE;
    while (a.Stopped==0)
        cp2=cp2+1;
        a=GETSTATE;
    end
    p(:,1)=toc;
    tic
    MOVE_BASE_Z(-50)
    a=GETSTATE;
    while (a.Stopped==0)
        cz=cz+1;
        a=GETSTATE;
    end
    p(:,2)=toc;
    tic
    MOVE_BASE_X(50)
    while (a.Stopped==0)
        cx=cx+1;
        a=GETSTATE;
    end
    p(:,3)=toc;
    %%
% end
% QoKX;450.00;Y;0.00;Z;405.00;A;-180.00;B;0.00;C;-180.00;;7,0;100;0.00;00000000