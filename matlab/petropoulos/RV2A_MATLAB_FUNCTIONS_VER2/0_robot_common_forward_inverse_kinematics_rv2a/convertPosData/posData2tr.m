function [HTR]=posData2tr(PosData)

x=1;
y=2;
z=3;
A=4;
B=5;
C=6;

f=4;

[m,n]=size(PosData);



if ( (m==6 && n==1) || (m==1 && n==6) )
    
    HTR=translatexyz(PosData(x),PosData(y),PosData(z))*...
        rotdx(PosData(A))*rotdy(PosData(B))*rotdz(PosData(C));
    
elseif  ( (m==4 && n==1) || (m==1 && n==4) )
    
        HTR=translatexyz(PosData(x),PosData(y),PosData(z))*...
        rotdz(PosData(f));
    
elseif (m==4 && n==4 && norm(PosData(1:3,1:3)) )    %na kanw elenxo metrou pinaka NORM()
    
    HTR=PosData;
    
else
    disp('--------------------------------------------------------------------');
        error('LATHOS DEDOMENA THESIS jjojoijoijio');
   
    
end
    