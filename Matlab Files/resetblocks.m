vars=evalin('base','vars');

vars.tonedblock=randi(2);
r=rand;
vars.block=vars.norigin;
vars.block(int32(vars.Ns/2+vars.Ns*r/5):int32(vars.Ns/2+vars.Ns*r/5+vars.Ns/10))=vars.block(int32(vars.Ns/2+vars.Ns*r/5):int32(vars.Ns/2+vars.Ns*r/5+vars.Ns/10))+vars.temptone;

assignin('base','vars',vars);