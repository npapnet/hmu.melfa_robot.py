% μετατροπή Ομογενών συντεταγμένων σε γενικευμένο διανυσμα (X,Y,Z,A,B,C)
% MELFA BASIC IV

function [Position_vector] = tr2melfa_pos(HTR)


   ABC=(tr2rpy(HTR))*180/pi;  %  fliplr flip gia metasximatismo rot zyx 
   Position_vector=[HTR(1,4), HTR(2,4), HTR(3,4), ABC(1), ABC(2), ABC(3)];

   
   
   
   
end

