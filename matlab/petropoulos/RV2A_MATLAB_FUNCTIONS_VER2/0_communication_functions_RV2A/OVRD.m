%SET BASE SPEED %

function OVRD(ovrd)
      cmd=['1;1;EXECOVRD ' num2str(ovrd) ];
      SendCmd(cmd);
end