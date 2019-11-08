fid = fopen('nc2311.m');
global X;
global Y;
global Z;

tline = fgets(fid);
i=1;
X(i)=0;
Y(i)=0;
Z(i)=0;
mover(i,1)=-1;
while ischar(tline)
 i=i+1
    pause(0.5);
    disp(tline)
    tline = fgets(fid);
    
    s=cellstr(tline);
    s=char(s);
    
    
    %%%%%%5678   $%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Euresi suntetagmenis Z na kanw to idio kai gia Z
%mono thetikes suntetagmenes
FX=strfind(s,'X');
if isempty(FX)
    X(i)=X(i-1);
    nX=0;
else 
    tel=strfind(s,'.');
    firsttel = find(tel>FX, 1,'first');
    plithos=tel(firsttel)-FX-1;
    
    x=0;
    for j=1:plithos
        x=x+(str2num(s(FX+j)))*10^(plithos-j);
      X(i)=x;  
    end
    
    %eval([genvarname([coor(i)]),'=x'])
    n=1;
end

FY=strfind(s,'Y');
if isempty(FY)
    Y(i)=Y(i-1);
    nY=0;
else 
    tel=strfind(s,'.');
    firsttel = find(tel>FY, 1,'first');
    plithos=tel(firsttel)-FY-1;
    
    y=0;
    for j=1:plithos
        y=y+(str2num(s(FY+j)))*10^(plithos-j);
        Y(i)=y;
    end
    
    %eval([genvarname([coor(i)]),'=Y'])
    n=1;
end

FZ=strfind(s,'Z');
if isempty(FZ)
    Z(i)=Z(i-1);
    nZ=0;
else 
    tel=strfind(s,'.');
    firsttel = find(tel>FZ, 1,'first');
    plithos=tel(firsttel)-FZ-1;
    
    z=0;
    for j=1:plithos
        z=z+(str2num(s(FZ+j)))*10^(plithos-j);
        Z(i)=z;
    end
    
    %eval([genvarname([coor(i)]),'=Z'])
    n=1;
end



%EURESI kinisi apo gnwstes


GM=['G00'; 'G01'; 'G02'; 'G03'];
MM=['MOV'; 'MVS'; 'MVR'; 'MVR'];
TM=[0;10;20;30];
        
        
        for k=1:2
            MV=strfind(s,GM(k,:));
            if ~isempty(MV)
                mover(i,1)=TM(k);  %MM(k,:); % string se pinaka ???/
                nm=1;
               k=7;
               
            end
          
        end
     
        if isempty(MV)
            mover(i,1)=mover(i-1);
            nm=0;
        end
        
        
        
         %%%%%%5678   $%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    
    
    
    
    
end

fclose(fid);