%B = A(1:4000,:);
%plot(B(:,1), B(:,2));

%C = A(1:16:10000,:);
%plot(C(:,1), C(:,2));

m = movement(A, 1000, 20);
plot(m);