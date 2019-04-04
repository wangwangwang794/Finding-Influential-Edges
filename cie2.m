%trying out a new idea! An important edge must connect two large-ish
%components..?
function [A,p] = cie2(B,k)
n=length(B);
CIE=zeros(n);
G=graph(B);
for i=1:n-1
    for j=i+1:n
        if B(i,j)==1
            rc1=k+randi(3)-2; rc2=k+randi(3)-2;
        if k<2
            rc1=k; rc2=k;
        end
            Ni=nearest(G,i,rc1); Ni=[Ni ; i]; Nj=nearest(G,j,rc2); Nj=[Nj ; j];        
            Cl=length(Ni);
            Cr=length(Nj);
            Cin=intersect(Ni,Nj);
            Cint=length(Cin);
            CIE(i,j)=(Cl-Cint)*(Cr-Cint);
        end
    end
end
CIE=CIE+CIE';
b=argmax(CIE);
b1=b(1,1); b2=b(1,2);
A=B;
A(b1,b2)=0; A(b2,b1)=0; 
p=0;
if b1==1 && b2==1
    disp("k=k-1"); p=1;
end
end
