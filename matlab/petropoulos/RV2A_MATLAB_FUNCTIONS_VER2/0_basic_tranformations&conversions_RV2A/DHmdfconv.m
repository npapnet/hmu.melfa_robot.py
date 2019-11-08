
function A=DHmdfconv(links_parameters)   % pinakas pou periexei [ái-1 , ai-1 , di , èé] 

alpha=links_parameters(1) ;  %ái
a=links_parameters(2) ;   %ai
d=links_parameters(3) ;  %di
theta=links_parameters(4); %èi

% i-1Ai(ái-1,ai-1,di,èi) = Rotx(ái-1)*Tx(ai-1) * Rotz(èi)*Tz(di)
% mdf DH conv by Craig


% i-1Ai(ái-1,ai-1,di,èi) = Rotx(ái-1)*Tx(ai-1) * Rotz(èi)*Tz(di)
A=rotdx(alpha)*translatexyz(a,0,0)*rotdz(theta)*translatexyz(0,0,d);
    
end
