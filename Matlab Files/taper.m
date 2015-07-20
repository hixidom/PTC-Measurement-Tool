function [output]=taper(input)
%Tapers the front and back of input signal signal
L=100;%taper size

output=input;
if max(size(output))>2*L
output(1:L)=output(1:L).*(1:L)/L;
output(end-L+1:end)=output(end-L+1:end).*(L:-1:1)/L;

end

