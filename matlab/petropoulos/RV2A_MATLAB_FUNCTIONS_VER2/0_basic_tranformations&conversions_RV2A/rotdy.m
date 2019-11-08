function Mtxroty = rotdy( ang )

c = cosd(ang);
s = sind(ang);

Mtxroty = [c 0 s 0; 0 1 0 0; (-s) 0 c 0; 0 0 0 1];

end
