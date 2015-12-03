function [ sumVecX ] = movement( pos, fs, f )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
n = ceil(fs/f);
N = floor(size(pos,1)/n);
sumVecX = zeros(N,1);
sumVecY = zeros(N,1);
for i=1:N
    sumVecX(i,1) = var(pos(n*(i-1)+2:n*i,1)-pos(n*(i-1)+1:n*i-1,1));
    sumVecY(i,1) = var(pos(n*(i-1)+2:n*i,2)-pos(n*(i-1)+1:n*i-1,2));
end

end

