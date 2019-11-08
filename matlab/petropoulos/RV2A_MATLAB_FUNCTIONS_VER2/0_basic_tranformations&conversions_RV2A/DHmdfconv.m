
function A=DHmdfconv(links_parameters)   % pinakas pou periexei [�i-1 , ai-1 , di , ��] 

alpha=links_parameters(1) ;  %�i
a=links_parameters(2) ;   %ai
d=links_parameters(3) ;  %di
theta=links_parameters(4); %�i

% i-1Ai(�i-1,ai-1,di,�i) = Rotx(�i-1)*Tx(ai-1) * Rotz(�i)*Tz(di)
% mdf DH conv by Craig


% i-1Ai(�i-1,ai-1,di,�i) = Rotx(�i-1)*Tx(ai-1) * Rotz(�i)*Tz(di)
A=rotdx(alpha)*translatexyz(a,0,0)*rotdz(theta)*translatexyz(0,0,d);
    
end
