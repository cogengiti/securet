function [ a, b, c ] = preferedDirection( pos )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Initialisation
a = 0; b = 0; c = 0;

% Number of points
N = size(pos,1);

% Minimal distance
d_best = 100000;

for iter = 1:50
    basePoints = randsample(N,2);
    x1 = pos(basePoints(1,1),1);
    y1 = pos(basePoints(1,1),2);
    x2 = pos(basePoints(2,1),1);
    y2 = pos(basePoints(2,1),1);
    
    d = 0;
    for i=1:N
        x = pos(i,1);
        y = pos(i,2);
        d = d+abs((y1-y2)*(x-x1)+(x2-x1)*(y-y1))/sqrt((y2-y1)^2+(x2-x1)^2);
    end
    
    if (d<d_best) 
        d_best = d;
        u = sqrt((x2-x1)^2+(y2-y1)^2);
        a = (y1-y2)/u;
        b = (x2-x1)/u;
        c = -(x1*(y1-y2)+y1*(x2-x1))/u;
    end
    


end

