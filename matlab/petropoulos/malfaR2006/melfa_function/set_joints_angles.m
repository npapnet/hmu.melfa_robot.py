function set_joints_angles( q1, q2 , q3 , q4 ,q5 ,q6)   %times 
    
    %for i=1:6
    %eval([genvarname(['Q',num2str(i)]),'=num2str(q(i))'])
    %end
    %cmd=['1;1;EXECJCOSIROP = (' Q1 ', ' Q2 ', ' Q3 ', ' Q4 ', ' Q5 ', ' Q6 ')']
    
         cmd=['1;1;EXECJCOSIROP = (' num2str(q1,'%10.3f') ', ' num2str(q2,'%10.3f') ', ' num2str(q3,'%10.3f') ', ' num2str(q4,'%10.3f') ', ' num2str(q5,'%10.3f') ', ' num2str(q6,'%10.3f') ')'];
         fprintf(s,cmd);