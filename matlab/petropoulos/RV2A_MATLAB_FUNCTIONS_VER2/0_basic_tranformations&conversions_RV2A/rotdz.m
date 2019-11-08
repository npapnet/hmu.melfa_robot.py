function Mtxrotz = rotdz( ang )

c = cosd(ang);
s = sind(ang);

Mtxrotz = [ c (-s) 0 0; s c 0 0; 0 0 1 0; 0 0 0 1 ];

end
