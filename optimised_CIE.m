Mat=Z;
iter=1;
repeat=1;
rdeg=sum(Mat)-1;
n=length(Mat);
G=graph(Mat);
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


while max(dismantle(Mat))<100
    CIE=cieo(CIE,k);
    if iter>5000
        break;
    end
    disp(iter);
    disp('-----------------');
    iter=iter+1;
    if max(dismantle(Mat))>repeat
        G3=graph(Mat);
        plot(G3);    
        pause;
    end
    repeat=max(dismantle(Mat));
end