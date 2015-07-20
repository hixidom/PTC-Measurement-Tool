set(readygui,'Visible','On');
resetblocks;

vars=evalin('base','vars');
if vars.tonedblock==1
    block1=vars.block;
    block2=vars.norigin;
else
    block1=vars.norigin;
    block2=vars.block;
end

switch vars.eartype
    case 1
        audio1=[block1',block1'*0];
        audio2=[block2',block2'*0];
    case 2
        audio1=[block1'*0,block1'];
        audio2=[block2'*0,block2'];
    case 3
        audio1=[block1',block1'];
        audio2=[block2',block2'];
end

pause(max(0,vars.readydelay));
sound(audio1,vars.Fs);
pause(vars.T+vars.readydelay/2);
sound(audio2,vars.Fs);
pause(vars.T-vars.readydelay/8);

set(readygui,'Visible','Off');
set(choosegui,'Visible','On');