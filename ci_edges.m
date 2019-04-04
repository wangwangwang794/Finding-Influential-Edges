%Function to give the edge with highest collective influence and the adjacency matrix after removing the edge.
function [A,l] = ci_edges(B,k)
n=length(B);
m=sum(sum(B))/2;
rdeg=sum(B)-1;
l=0;
G=graph(B);
CI=zeros(n,1);
for i=1:n
    C=nearest(G,i,k);
    C1=nearest(G,i,k-1);
    S=length(C1);
    s=linspace(1,S,S);
    C(s)=[];
    CI(i,1)=(sum(rdeg(C)));
end
CI;
CIE=zeros(n);
for i=1:n
    for j=1:n
        if B(i,j)==1
            CIE(i,j)=CI(i)+CI(j);
        end
    end
end
%Crafty way to find argmax. 
b=argmax(CIE);
b1=b(1,1); b2=b(1,2);
%disp(b2); disp(b1);
A=B;
CIE(b1,b2);
A(b1,b2)=0; A(b2,b1)=0; 

%%%%%Remove the lines here to make the code dismantle the network. Keep to de-cycle.
%{
while max(dismantle(A))>1
    A(b1,b2)=1; A(b2,b1)=1;
    CIE(b1,b2)=0;
    b=argmax(CIE);
    b1=b(1,1); b2=b(1,2);
    A(b1,b2)=0; A(b2,b1)=0;
end
%}
%%%%%



if sum(sum(A))-sum(sum(B))==0
    disp("Error!"); 
end
end

    
        
                
                            
                