%Function to give the edge with highest collective influence and the adjacency matrix after removing the edge.
function [A,l] = cie(B,k)
l=0;
n=length(B);
m=sum(sum(B))/2;
rdeg=sum(B)-1;
CI=zeros(n,1);
CIE=zeros(n);
for i=1:n
    for j=1:n
        if B(i,j)==1
            NG=B; NG(i,j)=0; NG(j,i)=0;
            G=graph(NG);
            Ngbd_i=nearest(G,i,k); Ngbd_j=nearest(G,j,k); 
            Ci=nearest(G,i,k-1); Cj=nearest(G,j,k-1); 
            Si=length(Ci); Sj=length(Cj);   
            si=linspace(1,Si,Si); sj=linspace(1,Sj,Sj);
            Ngbd_i(si)=[]; Ngbd_j(sj)=[];
            CI(i,1)=sum(rdeg(Ngbd_i));
            CI(j,1)=sum(rdeg(Ngbd_j));
            CIE(i,j)=CI(i)+CI(j);
        end
    end
end
b=argmax(CIE);
b1=b(1,1); b2=b(1,2);
disp(b2); disp(b1);
A=B;
CIE(b1,b2);
A(b1,b2)=0; A(b2,b1)=0; 

if sum(sum(A))-sum(sum(B))==0
    disp("Error!");
end
end

    
        
                
                            
                