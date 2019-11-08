
%%%%%%5678   $%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Euresi suntetagmenis Z na kanw to idio kai gia Z
%mono thetikes suntetagmenes
FX=findstr(s,'X')
if isempty(FX)
    X(i)=X(i-1);
    nX=0;
else 
    tel=findstr(s,'.')
    firsttel = find(tel>FX, 1,'first')
    plithos=tel(firsttel)-FX-1
    
    X=0
    for j=1:plithos
        X=X+(str2num(s(FX+j)))*10^(plithos-j);
        
    end
    X(i)=X
    %eval([genvarname([coor(i)]),'=x'])
    n=1
end

FY=findstr(s,'Y')
if isempty(FY)
    Y(i)=Y(i-1);
    nY=0;
else 
    tel=findstr(s,'.')
    firsttel = find(tel>FY, 1,'first')
    plithos=tel(firsttel)-FY-1
    
    Y=0
    for j=1:plithos
        Y=Y+(str2num(s(FY+j)))*10^(plithos-j);
        
    end
    Y(i)=Y
    %eval([genvarname([coor(i)]),'=Y'])
    n=1
end

FZ=findstr(s,'Z')
if isempty(FZ)
    Z(i)=Z(i-1);
    nZ=0;
else 
    tel=findstr(s,'.')
    firsttel = find(tel>FZ, 1,'first')
    plithos=tel(firsttel)-FZ-1
    
    Z=0
    for j=1:plithos
        Z=Z+(str2num(s(FZ+j)))*10^(plithos-j);
        
    end
    Z(i)=Z
    %eval([genvarname([coor(i)]),'=Z'])
    n=1
end



%EURESI kinisi apo gnwstes


GM=['G00'; 'G01'; 'G02'; 'G03']
MM=['MOV'; 'MVS'; 'MVR'; 'MVR']
        
        
        for i=1:2
            MV=findstr(s,GM(i,:));
            if ~isempty(MV)
                move=MM(i,:)
                nm=1;
                return
            end
          
        end
     
        if isempty(MV)
            move=movepr
            nm=0;
        end
        movepr=move
        
        
         %%%%%%5678   $%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%