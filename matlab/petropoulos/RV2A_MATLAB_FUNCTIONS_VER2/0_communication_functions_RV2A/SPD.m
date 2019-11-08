% SET interpolition speed mm/sec

function SPD(speed)
cmd=['1;1;EXECSPD ' num2str(speed) ];
      SendCmd(cmd);
end
