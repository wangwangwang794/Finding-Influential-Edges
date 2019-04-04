%trying out a new idea! An important edge must connect two large-ish
%components..?
function [A,l] = ci_int(B,k)
n=length(B);
rdeg=sum(B)-1;
CIE=zeros(n);
G=graph(B);
l=0;
for i=1:n
    for j=1:n
        if B(i,j)==1
            Ni=nearest(G,i,k); Nj=nearest(G,j,k);         
            Cl=sum(rdeg(Ni));
            Cr=sum(rdeg(Nj));
            Cin=intersect(Ni,Nj);
            Cint=sum(rdeg(Cin));
            CIE(i,j)=(Cl+Cr-Cint);
        end
    end
end
b=argmax(CIE);
b1=b(1,1); b2=b(1,2);
A=B;
A(b1,b2)=0; A(b2,b1)=0; 
if sum(sum(A))-sum(sum(B))==0
    disp("Error!");
end
end
