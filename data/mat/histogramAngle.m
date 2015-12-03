function [ angle ] = histogramAngle(pos,fs,f)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
n = ceil(fs/f);
N = floor(size(pos,1)/n);
angle = zeros(N,1);
for i=1:N
    [a,b,~] = preferedDirection(pos(n*(i-1)+1:n*i,:));
    angle(i,1) = 2*atan(b/(1+a));
end
    



end

