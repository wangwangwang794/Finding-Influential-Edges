%trying out a new idea! An important edge must connect two large-ish
%components. 
function [A,p] = cie3(B,k)
n=length(B);
CIE=zeros(n);
G=graph(B);
d=sum(B);
if k>0
    for i=1:n-1
        for j=i+1:n
            if B(i,j)==1
                Ni=nearest(G,i,k); Ni=[Ni ; i]; Nj=nearest(G,j,k); Nj=[Nj ; j];        
                Cl=length(Ni);
                Cr=length(Nj);
                Cin=intersect(Ni,Nj);
                Cint=length(Cin);
                CIE(i,j)=(Cl-Cint)*(Cr-Cint);
            end
        end
    end
    CIE=CIE+CIE';
    p=0;
end

if k==0
    for i=1:n-1
        for j=i+1:n
            if B(i,j)==1
                CIE(i,j)=d(i)*d(j);
            end
        end
    end
    CIE=CIE+CIE';
    p=0;
end
%for i=1:10
b=argmax(CIE);
b1=b(1,1); b2=b(1,2);
A=B;
A(b1,b2)=0; A(b2,b1)=0; 
%CIE(b1,b2)=0; CIE(b2,b1)=0;
%end
if sum(sum(A))-sum(sum(B))==0
    p=1;
end
end
