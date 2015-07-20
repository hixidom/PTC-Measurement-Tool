vars=evalin('base','vars');

%length of tone for option 3 (in seconds)
L=.01;

switch vars.tonetype
    case 1
        t=0:1/vars.Fs:vars.T/10;
        vars.tone=taper(sin(2*pi*vars.tf*t)*vars.threshapprox*sqrt(10));
    case 2
        t=0:1/vars.Fs:vars.T/10;
        vars.tone=taper(square(2*pi*vars.tf*t)*vars.threshapprox*sqrt(10));
    case 3
        t=0:(1/vars.Fs):L;
        vars.tone=horzcat(taper(sin(2*pi*vars.tf*t)*vars.threshapprox*sqrt(10)),t*0);
        while size(vars.tone,2)<=(vars.T/10)-(L*44100)
            vars.tone=horzcat(vars.tone,taper(sin(2*pi*vars.tf*t)*vars.threshapprox*sqrt(10)),t*0);
        end
end

assignin('base','vars',vars);