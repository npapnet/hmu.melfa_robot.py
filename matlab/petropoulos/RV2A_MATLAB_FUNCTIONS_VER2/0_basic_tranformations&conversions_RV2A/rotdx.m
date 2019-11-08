function Mtxrot = rotdx( ang )

c = cosd(ang);
s = sind(ang);

Mtxrot = [1 0 0 0; 0 c (-s) 0; 0 s c 0; 0 0 0 1];

end
