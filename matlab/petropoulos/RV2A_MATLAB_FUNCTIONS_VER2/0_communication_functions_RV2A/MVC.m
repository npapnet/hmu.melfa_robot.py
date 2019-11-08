function MVC(start_point, transit_point_1, transit_point_2)     %(STRING) 

        cmd=['1;1;EXECMVC ' start_point ', ' transit_point_1 ', ' transit_point_2];
        SendCmd(cmd);

%kinite se kuklo pou start_point = end_point, kai aktina pou orizetai apo ta transit_point}