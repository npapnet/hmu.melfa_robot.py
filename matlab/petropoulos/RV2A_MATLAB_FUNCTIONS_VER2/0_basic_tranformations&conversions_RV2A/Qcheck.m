function [ Q ] = Qcheck(Q,robot)
min=1;
max=2;

% Wrap_result=wrapTo180(THETA);
% Q=Wrap_result;
[r, c]=size(Q);
for j=1:c
for i=1:r
    
   check_result=(Q(i,j)>=robot.JointLimit(i,min) & Q(i,j)<=robot.JointLimit(i,max));
   
   if check_result==0
       Q(:,j)=NaN;
       
       %% ERROR (' ') εμφανιζει error me κοκκινα γράμματα
       %% Error termatizei ti sunartisi ???????????????????????????????
       
% disp('Angle out of RANGE , CHECK inputs,Wrap Result is:');
% display(Wrap_result);
         break;
       
   end
   
end

%% Boolean Bitand



end

