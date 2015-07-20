vars=evalin('base','vars');

vars.Ns=int32(vars.Fs*vars.T);
clear t vars.norigin vars.temptone;
vars.norigin(1:vars.Ns+1)=0;
t=0:1/vars.Fs:vars.T;

switch vars.noisetype
    case 1%Symmetric Threshold
        %Produce lower block of noise spectrum
        for f=vars.tf-vars.no:-vars.nspacing:vars.tf-vars.no-vars.nw
            if f<=0
                break;
            end
            p=rand*2*pi;
            vars.norigin=vars.norigin+sin(2*pi*f*t+p);
        end
        %Produce upper block of noise spectrum
        for f=vars.tf+vars.no:vars.nspacing:vars.tf+vars.no+vars.nw
            if f>20000
                break;
            end
            p=rand*2*pi;
            vars.norigin=vars.norigin+sin(2*pi*f*t+p);
        end
    case 2%Asymmetric Threshold Lower
        %Produce lower block of noise spectrum
        for f=vars.tf-vars.no:-vars.nspacing:vars.tf-vars.no-vars.nw
            if f<=0
                break;
            end
            p=rand*2*pi;
            vars.norigin=vars.norigin+sin(2*pi*f*t+p);
        end
    case 3%Asymmetric Threshold Upper
        %Produce upper block of noise spectrum
        for f=vars.tf+vars.no:vars.nspacing:vars.tf+vars.no+vars.nw
            if f>20000
                break;
            end
            p=rand*2*pi;
            vars.norigin=vars.norigin+sin(2*pi*f*t+p);
        end
    case 4%Freq vs Threshold
end
vars.norigin=taper(vars.norigin);

vars.norigin=vars.norigin/(10*max(vars.norigin));
vars.temptone=vars.tone*vars.threshapprox/sqrt(10);
try vars.trialno(vars.curtrial)=vars.no; end

assignin('base','vars',vars);