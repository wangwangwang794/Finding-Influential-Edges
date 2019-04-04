%Algorithm to find the collective influence of nodes (CUNY)
%Infuence maximization through maximum percolation- Morone and Makse

Mat=Z2;
iter=1;
while max(dismantle(Mat))<500
    
    [Mat]=noderemove(Mat,3
    );
    
    if iter>500
        break;
    end
    disp(iter);
    disp('-----------------');
    iter=iter+1;
    G3=graph(Mat);
    plot(G3);    
    pause;
    
end

G1=graph(Mat);
plot(G1)

function [A] = noderemove(B,k)
n=length(B);
m=sum(sum(B))/2;
rdeg=sum(B)-1;

G=graph(B);
CI=zeros(n,1);
for i=1:n
    C=nearest(G,i,k);
    C1=nearest(G,i,k-1);
    S=length(C1);
    s=linspace(1,S,S);
    C(s)=[];
    CI(i)=rdeg(i)*(sum(rdeg(C)));
end

[val,b]=max(CI);
disp(b);
A=delnode(B,b);
end
