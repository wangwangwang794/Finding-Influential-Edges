%important edge must be a part of maximum cycles
function [A,p] = cie4(B,k)
n=length(B);
m=sum(sum(B))/2;
CI=zeros(m);
G=graph(B);
d=sum(B);
if k>0
    CI=sum(cycles(B),2);
    p=0;
end

for i=1:100
[maxi,bd]=max(CI);
edges=table2array(G.Edges);
b=edges(bd,:);
b1=b(1,1); b2=b(1,2);
A=B;
A(b1,b2)=0; A(b2,b1)=0; 
CI(bd)=0; 
end
if sum(sum(A))-sum(sum(B))==0
    p=1;
end
end