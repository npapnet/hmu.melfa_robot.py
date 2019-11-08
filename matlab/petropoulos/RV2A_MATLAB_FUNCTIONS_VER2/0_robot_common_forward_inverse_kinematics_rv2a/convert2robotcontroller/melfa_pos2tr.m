%POSDATA=[540,0,180,0,180,0]
    function [ABT]=melfa_pos2tr(POSDATA)
[m,n]=size(POSDATA);

if (m==4 && n==4)                            %na kanw elenxo twn dedomenwn gia tin akeraiotita tous
    ABT=POSDATA;                              % i*j=k etc orthokanonikotita dianusmatwn prosanatolismou
elseif ((m==6 && n==1)||(m==1 && n==6))    
    ABT=translatexyz(POSDATA(1),POSDATA(2),POSDATA(3))*...
        rotdz(POSDATA(6)) * rotdy(POSDATA(5)) *  rotdx(POSDATA(4));
else
    error('LATHOS DEDOMENA THESIS jjojoijoijio')
end
    end