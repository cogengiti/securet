function [ varTransverse ] = varianceTransverseDirection( pos )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[a,b,c] = preferedDirection(pos);
varTransverse = var(abs(a*pos(:,1)+b*pos(:,2)+c));

end

