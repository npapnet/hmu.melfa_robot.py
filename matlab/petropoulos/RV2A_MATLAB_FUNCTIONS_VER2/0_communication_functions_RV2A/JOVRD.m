%SET JOG SPEED %
function JOVRD(jovrd)
      cmd=['1;1;EXECJOVRD ' num2str(jovrd) ];
      SendCmd(cmd);
end
