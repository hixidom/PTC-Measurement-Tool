vars=evalin('base','vars');

if vars.curtest>=vars.testnum
    if vars.testtype==2
        vars.cursubtrial=vars.cursubtrial+1;
    end
    switch vars.testtype
        case 1
        
        case 2
            vars.subtrialamp(vars.cursubtrial)=vars.subtrialamp(vars.cursubtrial-1)*3^(1/(vars.testnum-1));
            vars.n=vars.n*3^(1/(vars.testnum-1));
            vars.subtrialpercent(vars.cursubtrial-1)=vars.testdata/vars.testnum;
    end
    if vars.cursubtrial>vars.subtrialnum
        switch vars.testtype
            case 1
                vars.temptone=vars.tone*vars.threshapprox/sqrt(10);
                vars.trialthresh(vars.curtrial)=vars.trialthresh(vars.curtrial)/vars.subtrialnum;%is /testnum correct?
            case 2
                vars.trialthresh(vars.curtrial)=psyfuncfit(vars.subtrialamp,vars.subtrialpercent);
        end
        clearvars vars.subtrialamp vars.subtrialpercent;
        vars.curtrial=vars.curtrial+1;
        if vars.curtrial>vars.trialnum
            assignin('base','vars',vars);
            set(resultsgui,'Visible','On');
        else
            vars.no=vars.no+vars.ivchange;
            assignin('base','vars',vars);
            noisegen;
            vars=evalin('base','vars');
            vars.cursubtrial=1;
            vars.curtest=1;
            vars.trialthresh(vars.curtrial)=0;
            
            vars.curtest=1;
            vars.testdata=0;
            assignin('base','vars',vars);
            set(introgui,'Visible','On');
        end
    else
        assignin('base','vars',vars);
        playtonegui;
    end
else
    assignin('base','vars',vars);
    playtonegui;
end
