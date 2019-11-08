function [reply]=SAVE_CURRENT_POSITION(nop)
%c1,2,3,4,5,6->x,y,z,A,B,C > for cartesian coordinates]

%c1,2,3,4,5,6->J1:6> for JOINTS coordinates]
%
%Αποθηκευει την τρέχων θέση στο κοντρόλερ του ρομποτ 
%με όνομα που δίδεται ώς ορισμα σε αυτη τη συνάρτηση
%Αν δοθεί όρισμα με αρχικο P λαμβάνει τη  θέση P_CURR
%αντίστοιχα για το χώρο των αρθρώσεω αρχικο J >> J_CURR



if nop(1)=='P'
    
      cmd=['1;1;EXEC ' nop ' = P_CURR'];
            reply=SendCmd(cmd);

elseif nop(1)=='J'
    
    cmd=['1;1;EXEC ' nop ' = J_CURR'];
      reply=SendCmd(cmd);
      
else
    disp('lathos onoma ws orisma, >????<><><><??????')

end